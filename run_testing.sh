# market baseline
python3 run_testing.py --testing_type baseline --service_name market --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk11/market --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_market/Compile_baseline/

# market exp1
python3 run_testing.py --testing_type exp1 --service_name market --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk11/market --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_market/Compile_baseline/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_market/market_openapi.json

# market exp2
python3 run_testing.py --testing_type exp2 --service_name market --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk11/market --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_market/Compile_tree --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_market/market_openapi.json

# market tree
python3 run_testing.py --testing_type exp3 --service_name market --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk11/market --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_market/Compile_tree --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_market/market_openapi.json --init_dependencies_path /home/selab/Desktop/restler-fuzzer/restler/market_dependency_r1_distill_llama70B_only_data_dep_0302_output.json

# features-service baseline
python3 run_testing.py --testing_type baseline --service_name features-service --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/original/features-service --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_feature-service/Compile_baseline/ 

# features-service exp1
python3 run_testing.py --testing_type exp1 --service_name features-service --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/original/features-service --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_feature-service/Compile_baseline/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_feature-service/features_openapi.json

# features-service exp2
python3 run_testing.py --testing_type exp2 --service_name features-service --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/original/features-service --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_feature-service/Compile_tree --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_feature-service/features_openapi.json

# features-service tree
python3 run_testing.py --testing_type tree --service_name features-service --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/original/features-service --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_feature-service/Compile_tree --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_feature-service/features_openapi.json --init_dependencies_path /home/selab/Desktop/restler-fuzzer/restler/feature_dependency_r1_distill_llama70B_0307_output.json

# person-controller baseline
python3 run_testing.py --testing_type baseline --service_name person-controller --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/person-controller/ --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_person_controller/Compile_baseline/ 

# person-controller exp1
python3 run_testing.py --testing_type exp1 --service_name person-controller --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/person-controller/ --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_person_controller/Compile_baseline/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_person_controller/person_openapi.json

# person-controller exp2
python3 run_testing.py --testing_type exp2 --service_name person-controller --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/person-controller/ --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_person_controller/Compile_tree --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_person_controller/person_openapi.json

# person-controller tree
python3 run_testing.py --testing_type tree --service_name person-controller --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/person-controller/ --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_person_controller/Compile_baseline/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_person_controller/person_openapi.json --init_dependencies_path /home/selab/Desktop/restler-fuzzer/restler/person_controller_r1_distill_llama70B_0320_output.json

# genome-nexus baseline
python3 run_testing.py --testing_type baseline --service_name genome-nexus --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/genome-nexus/ --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_genome-nexus/Compile_baseline/

# genome-nexus exp1
python3 run_testing.py --testing_type exp1 --service_name genome-nexus --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/genome-nexus/ --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_genome-nexus/Compile_baseline/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_genome-nexus/genome_openapi.json

# genome-nexus exp2
python3 run_testing.py --testing_type exp2 --service_name genome-nexus --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/genome-nexus/ --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_genome-nexus/Compile_tree/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_genome-nexus/genome_openapi.json

# user-management baseline
python3 run_testing.py --testing_type baseline --service_name user-management --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/user-management/ --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_user/Compile_baseline

# user-management exp1
python3 run_testing.py --testing_type exp1 --service_name user-management --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/user-management/ --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_user/Compile_baseline/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_user/user_openapi.json

# user-management exp2
python3 run_testing.py --testing_type exp2 --service_name user-management --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/user-management/ --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_user/Compile_tree/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_user/user_openapi.json