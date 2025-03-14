import os
import sys
import json
import subprocess
from os import listdir
from os.path import isfile, join

curdir = os.getcwd()

services = ["features-service", "languagetool", "ncs", "news", "ocvn", "proxyprint", "restcountries", "scout-api",
            "scs", "erc20-rest-service", "genome-nexus", "person-controller", "problem-controller", "rest-study",
            "spring-batch-rest", "spring-boot-sample-app", "user-management", "cwa-verification", "market",
            "project-tracking-system"]
tools = ["evomaster-whitebox_data", "restler_data", "resttestgen_data", "restest_data", "bboxrt_data", "schemathesis_data", "tcases_data", "dredd_data", "evomaster-blackbox_data", "apifuzzer_data"]
class_name = ["app.coronawarn", "com.giassi.microservice", "com.test.sampleapp", "com.github.chrisgleissner", "org.restscs", "se.devscout.scoutapi", "com.in28minutes.rest.webservices.restfulwebservices", "eu.fayder.restcountries", "io.github.proxyprint.kitchen", "com.pfa.pack", "com.sw.project", "com.mongodb.starter", "org.devgateway", "org.tsdes.spring.examples.news", "org.restncs", "market", "org.languagetool", "org.cbioportal.genome_nexus", "org.javiermf.features", "io.blk.erc20"]

paths = [
    "services/evo_jdk8/cs/rest/original/features-service",
    "services/evo_jdk8/cs/rest/original/languagetool",
    "services/evo_jdk8/cs/rest/artificial/ncs",
    "services/evo_jdk8/cs/rest/artificial/news",
    "services/evo_jdk8/cs/rest-gui/ocvn",
    "services/evo_jdk8/cs/rest/original/proxyprint",
    "services/evo_jdk8/cs/rest/original/restcountries",
    "services/evo_jdk8/cs/rest/original/scout-api",
    "services/evo_jdk8/cs/rest/artificial/scs",
    "services/jdk8/erc20-rest-service",
    "services/jdk8/genome-nexus",
    "services/jdk8/person-controller",
    "services/jdk8/problem-controller",
    "services/jdk8/rest-study",
    "services/jdk8/spring-batch-rest",
    "services/jdk8/spring-boot-sample-app",
    "services/jdk8/user-management",
    "services/jdk11/cwa-verification",
    "services/jdk11/market",
    "services/jdk11/project-tracking-system",
]

source_code_path = sys.argv[1]

print("Generating report")
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

jacoco_command1 = 'java -jar org.jacoco.cli-0.8.7-nodeps.jar report '
# coverage_file = 'result/jacoco_6300_6.exec'
coverage_file = sys.argv[2]
jacoco_command2 = jacoco_command2 + ' --csv '
# jacoco_file = "result/report"
output_csv = sys.argv[3]

# jacoco_command = jacoco_command1 + coverage_file + jacoco_command2 + jacoco_file
jacoco_command = jacoco_command1 + coverage_file + jacoco_command2 + output_csv

subprocess.run(jacoco_command, shell=True)

