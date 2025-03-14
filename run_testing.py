import subprocess
import sys
import time
import threading
import os
import csv
import signal

JACOCO_AGENT_JAR = "/home/jclin/Desktop/REST_Go/org.jacoco.agent-0.8.7-runtime.jar"
JACOCO_CLI_JAR = "/home/jclin/Desktop/REST_Go/org.jacoco.cli-0.8.7-nodeps.jar"

should_exit = False

def run_service(service, port, evo="blackbox"):
    print(f"Running service {service} on port {port} with {evo}")
    command = ["python3", "run_service.py", service, port, evo]
    try:
        result = subprocess.run(command, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        print(result.stdout.decode())
    except subprocess.CalledProcessError as e:
        print(f"Command failed with error: {e.stderr.decode()}")

# Calculate coverage
def analyze_instruction_covered_sum(csv_file_path):
    total_instruction_covered = 0
    total_instruction_missed = 0
    try:
        with open(csv_file_path, mode='r') as file:
            csv_reader = csv.DictReader(file)
            for row in csv_reader:
                total_instruction_covered += int(row['INSTRUCTION_COVERED'])
        with open(csv_file_path, mode='r') as file:
            csv_reader = csv.DictReader(file)
            for row in csv_reader:
                total_instruction_missed += int(row['INSTRUCTION_MISSED']) 
    except Exception as e:
        print(f"Failed to analyze coverage: {e}")
    return total_instruction_covered, total_instruction_missed
        
def run_get_cov(service_name, port, source_code_path):
    print("Start getting coverage...")
    TIME_INTERVAL_1MIN = 1
    NO_INTERVAL_1MIN = 180
    TERMINATED_COUNT = 10
    
    report_dir = os.path.join(os.path.dirname(__file__), f"report_{service_name}")

    count = 0
    previous_coverage = 0
    for i in range(1, NO_INTERVAL_1MIN + 1):
        # Get coverage .exec file
        command = [
            "java", "-jar", JACOCO_CLI_JAR, "dump",
            "--address", "localhost", "--port", port,
            "--destfile", f"{report_dir}/jacoco_{port}_{i}.exec"
        ]

        try:
            result = subprocess.run(command, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            print(result.stdout.decode())
        except subprocess.CalledProcessError as e:
            print(f"Failed to execute Jacoco dump command: {e.stderr.decode()}")

        # Get coverage .csv file
        subdirs = [x[0] for x in os.walk(source_code_path)]
        class_files = []
        jacoco_command2 = ''
        
        for subdir in subdirs:
            if source_code_path in subdir and '/target/classes/' in subdir:
                target_dir = subdir[:subdir.rfind('/target/classes/') + 15]
                if target_dir not in class_files:
                    class_files.append(target_dir)
                    jacoco_command2 = jacoco_command2 + ' --classfiles ' + target_dir
            if source_code_path in subdir and '/build/classes/' in subdir:
                target_dir = subdir[:subdir.rfind('/build/classes/') + 14]
                if target_dir not in class_files:
                    class_files.append(target_dir)
                    jacoco_command2 = jacoco_command2 + ' --classfiles ' + target_dir
        
        jacoco_command1 = f'java -jar {JACOCO_CLI_JAR} report '
        coverage_file = f"{report_dir}/jacoco_{port}_{i}.exec"
        jacoco_command2 = jacoco_command2 + ' --csv '
        output_csv = f"{report_dir}/report_{port}_{i}.csv"
        jacoco_command = jacoco_command1 + coverage_file + jacoco_command2 + output_csv
        try:
            subprocess.run(jacoco_command, shell=True)
        except subprocess.CalledProcessError as e:
            print(f"Failed to execute Jacoco report command: {e.stderr.decode()}")
            break
        finally:
            if not os.path.exists(output_csv):
                print(f"Failed to generate coverage report for iteration {i}")
                break

        total_covered, total_missed = analyze_instruction_covered_sum(output_csv)
        total_coverage = total_covered / (total_covered + total_missed) * 100
        if i == 1:
            print(f"Initial coverage: {total_coverage}%")
        else:
            print(f"Total coverage ({i}th): {total_coverage}%")
        
        # Compare coverage
        if total_coverage == previous_coverage:
            if count < TERMINATED_COUNT:
                count += 1
            else:
                print("No change in coverage")
                break
        else:
            count = 1
            previous_coverage = total_coverage
        
        time.sleep(TIME_INTERVAL_1MIN * 60)

def run_testing(service_name, restler_command):
    print("Running RESTler...")
    report_dir = os.path.join(os.path.dirname(__file__), f"report_{service_name}")
    os.makedirs(report_dir, exist_ok=True)
    os.chdir(report_dir)
    with open("restler_output.log", "w") as log_file:
        subprocess.Popen(restler_command, stdout=log_file, stderr=subprocess.STDOUT)

def kill_process_using_port(port):
    command = f"lsof -t -i:{port}"
    print(f"Killing process using port {port}...")
    try:
        result = subprocess.run(command, shell=True, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        if result.stdout == b'':
            print(f"No process using port {port} found.")
            return
        pid = int(result.stdout.decode().strip())
        os.kill(pid, signal.SIGKILL)
        print(f"Process using port {port} has been killed.")
    except subprocess.CalledProcessError as e:
        print(f"Failed to find or kill process using port {port}: {e.stderr.decode()}")

def kill_process_using_tmux(service_name):
    command = f"tmux kill-session -t {service_name}"
    print(f"Killing process using tmux session {service_name}...")
    try:
        result = subprocess.run(command, shell=True, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        print(f"Process using tmux session {service_name} has been killed.")
    except subprocess.CalledProcessError as e:
        print(f"Failed to find or kill process using tmux session {service_name}: {e.stderr.decode()}")

def kill_process_restler():
    command = "ps aux | grep 'restler' | grep -v grep | awk '{print $2}'"
    print("Killing RESTler process...")
    try:
        result = subprocess.run(command, shell=True, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        pids = result.stdout.decode().strip().split()
        if not pids:
            print("No RESTler process found.")
            return
        for pid in pids:
            os.kill(int(pid), signal.SIGKILL)
            print(f"RESTler process with PID {pid} has been killed.")
    except subprocess.CalledProcessError as e:
        print(f"Failed to find or kill RESTler process: {e.stderr.decode()}")

if __name__ == "__main__":
    print("Make sure to activate the virtual environment and install requirements before running this script.")
    service_name = sys.argv[1]
    port = sys.argv[2]
    evo = sys.argv[3]
    source_code_path = sys.argv[4]      # Absolute path to the source code directory
    restler_py = sys.argv[5]            # Absolute path to the restler.py
    restler_compile_dir = sys.argv[6]   # Absolute path to the restler compile directory

    restler_command = [
        "python3", restler_py,
        "--restler_grammar", os.path.join(restler_compile_dir, "grammar.py"),
        "--custom_mutations", os.path.join(restler_compile_dir, "dict.json"),
        "--set_version", "9.2.2",
        "--no_ssl",
        "--settings", os.path.join(restler_compile_dir, "engine_settings.json"),
        "--include_user_agent",
        "--no_tokens_in_logs", "t",
        "--enable_checkers", "*",
        "--disable_checkers", "namespacerule",
        "--garbage_collection_interval", "30",
        "--time_budget", "3",
        "--fuzzing_mode", "bfs-cheap",
        "--max_sequence_length", "100"
    ]
    
    # kill_process_restler()   
    kill_process_using_port(port)
    kill_process_using_tmux(service_name)
    
    time.sleep(5)
    
    run_service(service_name, port, evo)
    
    time.sleep(15)
    
    cov_thread = threading.Thread(target=run_get_cov, args=(service_name, port, source_code_path))
    cov_thread.start()
    
    time.sleep(5)
    
    try: 
        run_testing(service_name, restler_command)
    finally:
        cov_thread.join()
        
        # Kill the related process
        kill_process_using_port(port)
        kill_process_using_tmux(service_name)
        kill_process_restler() 