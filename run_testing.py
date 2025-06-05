import subprocess
import time
import threading
import os
import csv
import signal
import argparse

JACOCO_AGENT_JAR = "/home/selab/Desktop/REST_Go/org.jacoco.agent-0.8.7-runtime.jar"
JACOCO_CLI_JAR = "/home/selab/Desktop/REST_Go/org.jacoco.cli-0.8.7-nodeps.jar"

report_dir = ""
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
        
def run_get_cov(service_name, port, source_code_path, NO_INTERVAL_MIN):
    print("Start getting coverage...")
    TIME_INTERVAL_1MIN = 1
    # TERMINATED_COUNT = 10
    # count = 1
    previous_coverage = 0
    for i in range(1, NO_INTERVAL_MIN + 1):
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
        # if total_coverage == previous_coverage:
        #     if count < TERMINATED_COUNT:
        #         count += 1
        #     else:
        #         print("No change in coverage")
        #         break
        # else:
        #     count = 1
        #     previous_coverage = total_coverage
        
        time.sleep(TIME_INTERVAL_1MIN * 60)

def run_testing(service_name, restler_command):
    print("Running RESTler...")
    os.makedirs(report_dir, exist_ok=True)
    os.chdir(report_dir)
    with open("restler_output.log", "w") as log_file:
        subprocess.Popen(restler_command, stdout=log_file, stderr=subprocess.STDOUT)

def run_morest(morest_command):
    print("Running MoREST...")
    os.makedirs(report_dir, exist_ok=True)
    os.chdir("/home/selab/Desktop/other/morest")
    with open(f"{report_dir}/morest_output.log", "w") as log_file:
        subprocess.Popen(morest_command, stdout=log_file, stderr=subprocess.STDOUT)
    pass

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


if __name__ == "__main__":
    print("\nMake sure to activate the virtual environment and install requirements before running this script.\n")
    parser = argparse.ArgumentParser(description="Run testing script with specified parameters.")
    parser.add_argument("--testing_type", choices=["baseline", "exp1", "exp2", "exp3", "morest", "autoresttest"], help="Type of testing to perform.", required=True)
    parser.add_argument("--service_name", help="Name of the service to test.", required=True)
    parser.add_argument("--port", help="Port number for the service.", default="6300")
    parser.add_argument("--type", help="Evolution type (e.g., blackbox).", default="blackbox")
    parser.add_argument("--time_budget", help="Time budget for the testing.", default="180")
    parser.add_argument("--source_code_path", help="Absolute path to the source code directory.", required=True)
    parser.add_argument("--restler_py", help="Absolute path to the restler.py script.", required=True)
    parser.add_argument("--restler_compile_dir", help="Absolute path to the restler compile directory.")
    parser.add_argument("--init_dependencies_path", help="Absolute path to the init dependencies file.", default=None)
    parser.add_argument("--api_spec_path", help="Absolute path to the API specification file.", default=None)
    parser.add_argument("--url", help="URL for the service.", default="https://restcountries.com")
    args = parser.parse_args()

    testing_type = args.testing_type
    service_name = args.service_name
    port = args.port
    evo = args.type
    source_code_path = args.source_code_path
    restler_py = args.restler_py
    restler_compile_dir = args.restler_compile_dir
    api_spec_path = args.api_spec_path
    init_dependencies_path = args.init_dependencies_path
    url = args.url

    report_dir = os.path.join(os.path.dirname(__file__), f"report_{service_name}_{time.time()}")
    cur_dir = os.path.dirname(__file__)
    
    NO_INTERVAL_MIN = int(args.time_budget)
    running_time = f"{NO_INTERVAL_MIN / 60}"
    max_sequence_length = f"100"
    openai_api_key = "AIzaSyC39IULl23NG3H1mq8lGSx3_jb-pfgPmMk"
    
    if testing_type == "baseline":
        print("\nRunning baseline test... Make sure restler.py is in baseline branch.\n")
        fuzzingMode = "bfs-cheap"
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
            "--time_budget", running_time,
            "--fuzzing_mode", fuzzingMode,
            "--max_sequence_length", max_sequence_length
        ]
    elif testing_type == "exp1" or testing_type == "exp2":
        if testing_type == "exp1":
            print("\nRunning experiment 1 test... Make sure restler.py is in !!!feedback-llm_v6_exp1!!! branch.\n")
        elif testing_type == "exp2":
            print("\nRunning experiment 2 test... Make sure restler.py is in current branch.\n")
        fuzzingMode = "bfs-cheap"
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
            "--time_budget", running_time,
            "--fuzzing_mode", fuzzingMode,
            "--max_sequence_length", max_sequence_length,
            "--llm_mode", "genai",
            "--llm_model", "gemini-2.0-flash",
            "--llm_api_key", openai_api_key,
            "--api_spec_path", api_spec_path
        ]
    elif testing_type == "exp3":
        print("\nRunning experiment 3 test... Make sure restler.py is in tree_dep branch.\n")
        fuzzingMode = "tree"
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
            "--time_budget", running_time,
            "--fuzzing_mode", fuzzingMode,
            "--max_sequence_length", max_sequence_length,
            "--llm_mode", "genai",
            "--llm_model", "gemini-2.0-flash",
            "--llm_api_key", openai_api_key,
            "--api_spec_path", api_spec_path,
            "--init_dependencies_path", init_dependencies_path
        ]
    elif testing_type == "morest": 
        morest_command = [
            "python3", restler_py,
            "--yaml_path", api_spec_path,
            "--time_budget", f"{NO_INTERVAL_MIN * 60}",
            "--url", url,
            "--output_dir", f"report_{service_name}",
        ]
    elif testing_type == "autoresttest":
        autoresttest_command = [
            "python3", restler_py
        ]
            
    run_service(service_name, port, evo)
    
    time.sleep(15)
    
    cov_thread = threading.Thread(target=run_get_cov, args=(service_name, port, source_code_path, NO_INTERVAL_MIN))
    cov_thread.start()
    
    time.sleep(5)
    
    try: 
        start_time = time.time()
        if testing_type == "morest":
            # run_morest(morest_command)
            pass
        if testing_type == "autoresttest":
            pass
        else:
            run_testing(service_name, restler_command)
    finally:
        cov_thread.join()
        
        # Write to file that the coverage has been exhausted
        # with open("coverage_exhausted.txt", "w") as f:
        #     f.write("Coverage has been exhausted.\n")
        #     # Write the time to file
        #     f.write(f"Start time: {start_time}\n")
        #     f.write(f"End time: {time.time()}\n")
        
        # time.sleep(10)
        
        # Kill the related process
        kill_process_using_port(port)
        kill_process_using_tmux(service_name)