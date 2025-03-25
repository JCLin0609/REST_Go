import subprocess
import time
import sys
import os
import signal
JAVA8_HOME = "/usr/lib/jvm/java-1.8.0-openjdk-arm64"
JAVA11_HOME = "/usr/lib/jvm/java-11-openjdk-arm64"

def run_service(service_path, class_name):
    with open(service_path + "/cp.txt", 'r') as f:
        cp = f.read()
    with open(service_path + "/run.sh", 'w') as f:
        f.write("java -Djdk.attach.allowAttachSelf=true " + cov + " -cp target/classes:target/test-classes:" + cp + ' ' + class_name + " > " + base + "/log_" + cov_port + ".txt")
    if name == "cwa-verification" or name == "market" or name == "project-tracking-system":
        subprocess.run(". ./java11.env && cd " + service_path + " && tmux new-session -d -s " + name + " 'sudo sh run.sh'", shell=True)
    else:
        subprocess.run("bash ./java8.env && cd " + service_path + " && tmux new-session -d -s " + name + " ' sh run.sh'", shell=True)

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
    name = sys.argv[1]
    cov_port = sys.argv[2]
    evo = sys.argv[3]
    base = os.getcwd()

    cov1 = '-javaagent:' + base +'/org.jacoco.agent-0.8.7-runtime.jar=includes=*,output=tcpserver,port="'
    cov2 = '",address=*,dumponexit=true -Dfile.encoding=UTF-8'
    cov = cov1 + str(cov_port) + cov2

    kill_process_using_port(cov_port)
    kill_process_using_tmux(name)
    
    if evo == "whitebox":
        if name == "features-service":
            run_service("./services/evo_jdk8/em/embedded/rest/features-service", "em.embedded.org.javiermf.features.EmbeddedEvoMasterController")
        elif name == "languagetool":
            run_service("./services/evo_jdk8/em/embedded/rest/languagetool", "em.embedded.org.languagetool.EmbeddedEvoMasterController")
        elif name == "ncs":
            run_service("./services/evo_jdk8/em/embedded/rest/ncs", "em.embedded.org.restncs.EmbeddedEvoMasterController")
        elif name == "news":
            run_service("./services/evo_jdk8/em/embedded/rest/news", "em.embedded.org.tsdes.EmbeddedEvoMasterController")
        elif name == "ocvn":
            run_service("./services/evo_jdk8/em/embedded/rest/ocvn", "em.embedded.org.devgateway.ocvn.EmbeddedEvoMasterController")
        elif name == "proxyprint":
            run_service("./services/evo_jdk8/em/embedded/rest/proxyprint", "em.embedded.io.github.proxyprint.kitchen.EmbeddedEvoMasterController")
        elif name == "restcountries":
            run_service("./services/evo_jdk8/em/embedded/rest/restcountries", "em.embedded.eu.fayder.EmbeddedEvoMasterController")
        elif name == "scout-api":
            run_service("./services/evo_jdk8/em/embedded/rest/scout-api", "em.embedded.se.devscout.scoutapi.EmbeddedEvoMasterController")
        elif name == "scs":
            run_service("./services/evo_jdk8/em/embedded/rest/scs", "em.embedded.org.restscs.EmbeddedEvoMasterController")
        elif name == "erc20-rest-service":
            print("Done with Intellij")
        elif name == "genome-nexus":
            subprocess.run("sudo docker run --name=gn-mongo --restart=always -p 27018:27017 -d genomenexus/gn-mongo:latest", shell=True)
            time.sleep(30)
            run_service("./services/jdk8/genome-nexus/web", "org.evo.EMDriver")
        elif name == "person-controller":
            subprocess.run("sudo docker run -d -p 27019:27017 --name mongodb mongo:latest", shell=True)
            time.sleep(30)
            run_service("./services/jdk8/person-controller", "org.evo.EMDriver")
        elif name == "problem-controller":
            subprocess.run("sudo docker run -d -p 3307:3306 --name mysql -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=test mysql", shell=True)
            time.sleep(30)
            run_service("./services/jdk8/problem-controller", "org.evo.EMDriver")
        elif name == "rest-study":
            run_service("./services/jdk8/rest-study", "org.evo.EMDriver")
        elif name == "spring-batch-rest":
            run_service("./services/jdk8/spring-batch-rest/example/api", "org.evo.EMDriver")
        elif name == "spring-boot-sample-app":
            run_service("./services/jdk8/spring-boot-sample-app", "org.evo.EMDriver")
        elif name == "user-management":
            subprocess.run("sudo docker run -d -p 3306:3306 --name mysqldb -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=users mysql", shell=True)
            time.sleep(30)
            run_service("./services/jdk8/user-management", "org.evo.EMDriver")
        elif name == "cwa-verification":
            run_service("./services/jdk11/cwa-verification/em/embedded/rest/cwa-verification", "em.embedded.app.coronawarn.verification.EmbeddedEvoMasterController")
        elif name == "market":
            run_service("./services/jdk11/market/market-rest", "org.evo.EMDriver")
        elif name == "project-tracking-system":
            run_service("./services/jdk11/project-tracking-system", "org.evo.EMDriver")
    else:
        if name == "features-service":
            run_service("./services/evo_jdk8/em/embedded/rest/features-service", "em.embedded.org.javiermf.features.RunServer")
        elif name == "languagetool":
            run_service("./services/evo_jdk8/em/embedded/rest/languagetool", "em.embedded.org.languagetool.RunServer")
        elif name == "ncs":
            run_service("./services/evo_jdk8/em/embedded/rest/ncs", "em.embedded.org.restncs.RunServer")
        elif name == "news":
            run_service("./services/evo_jdk8/em/embedded/rest/news", "em.embedded.org.tsdes.RunServer")
        elif name == "ocvn":
            run_service("./services/evo_jdk8/em/embedded/rest/ocvn", "em.embedded.org.devgateway.ocvn.RunServer")
        elif name == "proxyprint":
            run_service("./services/evo_jdk8/em/embedded/rest/proxyprint", "em.embedded.io.github.proxyprint.kitchen.RunServer")
        elif name == "restcountries":
            run_service("./services/evo_jdk8/em/embedded/rest/restcountries", "em.embedded.eu.fayder.RunServer")
        elif name == "scout-api":
            run_service("./services/evo_jdk8/em/embedded/rest/scout-api", "em.embedded.se.devscout.scoutapi.RunServer")
        elif name == "scs":
            run_service("./services/evo_jdk8/em/embedded/rest/scs", "em.embedded.org.restscs.RunServer")
        elif name == "erc20-rest-service":
            subprocess.run("tmux new -d -s erc20-rest-service '. java8.env && java " + cov + " -jar ./services/jdk8/erc20-rest-service/build/libs/erc20-rest-service-0.1.0.jar" + " > " + base + "/log_" + cov_port + ".txt'", shell=True)
        elif name == "genome-nexus":
            subprocess.run("sudo docker stop gn-mongo", shell=True)
            subprocess.run("sudo docker rm gn-mongo", shell=True)
            subprocess.run("sudo docker run --name=gn-mongo --restart=always -p 27018:27017 -d genomenexus/gn-mongo:latest", shell=True)
            time.sleep(10)
            subprocess.run("tmux new -d -s genome-nexus 'bash java8.env && java " + cov + " -jar ./services/jdk8/genome-nexus/web/target/web-0-unknown-version-SNAPSHOT.war" + " > " + base + "/log_" + cov_port + ".txt'", shell=True)
        elif name == "person-controller":
            subprocess.run("sudo docker stop mongodb", shell=True, check=True)
            subprocess.run("sudo docker rm mongodb", shell=True, check=True)
            time.sleep(5)
            subprocess.run("sudo docker run -d -p 27019:27017 --name mongodb mongo:latest --replSet rs0", shell=True, check=True)
            time.sleep(5)
            initiate_command = "echo 'rs.initiate()' | sudo docker exec -i mongodb mongosh"
            subprocess.run(initiate_command, shell=True, check=True)
            subprocess.run("tmux new -d -s person-controller '. java8.env && java " + cov + " -jar ./services/jdk8/person-controller/target/java-spring-boot-mongodb-starter-1.0.0.jar" + " > " + base + "/log_" + cov_port + ".txt'", shell=True)
            # run_service("./services/jdk8/person-controller", "org.evo.EMDriver")
        elif name == "problem-controller":
            subprocess.run("sudo docker run -d -p 3307:3306 --name mysql -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=test mysql", shell=True)
            time.sleep(30)
            subprocess.run("tmux new -d -s problem-controller '. java8.env && java " + cov + " -jar ./services/jdk8/problem-controller/target/project-api-0.0.1.jar" + " > " + base + "/log_" + cov_port + ".txt'", shell=True)
        elif name == "rest-study":
            subprocess.run("tmux new -d -s rest-study '. java8.env && java " + cov + " -jar ./services/jdk8/rest-study/target/restful-web-services-0.0.1-SNAPSHOT.jar" + " > " + base + "/log_" + cov_port + ".txt'", shell=True)
        elif name == "spring-batch-rest":
            subprocess.run("tmux new -d -s spring-batch-rest '. java8.env && java " + cov + " -jar ./services/jdk8/spring-batch-rest/example/api/target/spring-batch-rest-example-core-1.5.1.jar" + " > " + base + "/log_" + cov_port + ".txt'", shell=True)
        elif name == "spring-boot-sample-app":
            run_service("./services/jdk8/spring-boot-sample-app", "com.test.sampleapp.Application")
        elif name == "user-management":
            subprocess.run("sudo docker run -d -p 3306:3306 --name mysqldb -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=users mysql", shell=True)
            time.sleep(30)
            subprocess.run("tmux new -d -s user-management '. java8.env && java " + cov + " -jar ./services/jdk8/user-management/target/microdemo2-1.0.0-SNAPSHOT.jar" + " > " + base + "/log_" + cov_port + ".txt'", shell=True)
        elif name == "cwa-verification":
            run_service("./services/jdk11/cwa-verification/em/embedded/rest/cwa-verification", "em.embedded.app.coronawarn.verification.RunServer")
        elif name == "market":
            subprocess.run("tmux new -d -s market '. java11.env && java -Djdk.attach.allowAttachSelf=true " + cov + " -jar ./services/jdk11/market/market-rest/target/market-rest-0.1.2.jar" + " > " + base + "/log_" + cov_port + ".txt'", shell=True)
        elif name == "project-tracking-system":
            subprocess.run("tmux new -d -s project-tracking-system '. java11.env && java -Djdk.attach.allowAttachSelf=true " + cov + " -jar ./services/jdk11/project-tracking-system/target/project-tracking-system.jar" + " > " + base + "/log_" + cov_port + ".txt'", shell=True)
