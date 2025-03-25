# market baseline
python3 run_testing.py market 6300 blackbox /home/selab/Desktop/REST_Go/services/jdk11/market /home/selab/Desktop/restler-fuzzer/restler/restler.py /home/selab/Desktop/restler_sut_result/REST_GO_market/Compile_baseline/

# market exp1
python3 run_testing.py market 6300 blackbox /home/selab/Desktop/REST_Go/services/jdk11/market /home/selab/Desktop/restler-fuzzer/restler/restler.py /home/selab/Desktop/restler_sut_result/REST_GO_market/Compile_baseline/ /home/selab/Desktop/restler_sut_result/REST_GO_market/market_openapi.json

# market tree
python3 run_testing.py market 6300 blackbox /home/selab/Desktop/REST_Go/services/jdk11/market /home/selab/Desktop/restler-fuzzer/restler/restler.py /home/selab/Desktop/restler_sut_result/REST_GO_market/Compile /home/selab/Desktop/restler_sut_result/REST_GO_market/market_openapi.json /home/selab/Desktop/restler-fuzzer/restler/market_dependency_r1_distill_llama70B_only_data_dep_0302_output.json

# features-service baseline
python3 run_testing.py features-service 6300 blackbox /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/original/features-service /home/selab/Desktop/restler-fuzzer/restler/restler.py /home/selab/Desktop/restler_sut_result/REST_GO_feature-service/Compile_baseline/ 

# features-service tree
python3 run_testing.py features-service 6300 blackbox /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/original/features-service /home/selab/Desktop/restler-fuzzer/restler/restler.py /home/selab/Desktop/restler_sut_result/REST_GO_feature-service/Compile_tree /home/selab/Desktop/restler_sut_result/REST_GO_feature-service/features_openapi.json /home/selab/Desktop/restler-fuzzer/restler/feature_dependency_r1_distill_llama70B_0307_output.json

# person-controller baseline
python3 run_testing.py person-controller 6300 blackbox /home/selab/Desktop/REST_Go/services/jdk8/person-controller/ /home/selab/Desktop/restler-fuzzer/restler/restler.py /home/selab/Desktop/restler_sut_result/REST_GO_person_controller/Compile_baseline/

# person-controller tree
python3 run_testing.py person-controller 6300 blackbox /home/selab/Desktop/REST_Go/services/jdk8/person-controller/ /home/selab/Desktop/restler-fuzzer/restler/restler.py /home/selab/Desktop/restler_sut_result/REST_GO_person_controller/Compile_baseline/ /home/selab/Desktop/restler_sut_result/REST_GO_person_controller/person_openapi.json /home/selab/Desktop/restler-fuzzer/restler/person_controller_r1_distill_llama70B_0320_output.json

# genome-nexus baseline
python3 run_testing.py genome-nexus 6300 blackbox /home/selab/Desktop/REST_Go/services/jdk8/genome-nexus/ /home/selab/Desktop/restler-fuzzer/restler/restler.py /home/selab/Desktop/restler_sut_result/REST_GO_genome-nexus/Compile_baseline/