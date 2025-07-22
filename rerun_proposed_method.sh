# market tree
python3 run_testing.py --testing_type exp3 --service_name market --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk11/market --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_market/Compile_tree --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_market/market_openapi.json --init_dependencies_path /home/selab/Desktop/restler-fuzzer/sut_relation_description_new/market_gemini_0407_output.json

# user-management tree
python3 run_testing.py --testing_type exp3 --service_name user-management --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/user-management/ --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_user/Compile_tree/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_user/user_openapi.json --init_dependencies_path /home/selab/Desktop/restler-fuzzer/sut_relation_description_new/user_gemini_0408_output.json

# project-tracking tree aratrl
python3 run_testing.py --testing_type exp3 --service_name project-tracking-system --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk11/project-tracking-system --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/ARAT_RL_project/Compile_tree --api_spec_path /home/selab/Desktop/restler_sut_result/ARAT_RL_project/project.json --init_dependencies_path /home/selab/Desktop/restler-fuzzer/sut_relation_description_new/project_gemini_0425_output.json

# news tree
python3 run_testing.py --testing_type exp3 --service_name news --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/artificial/news --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_news/Compile_tree/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_news/news_openapi.json --init_dependencies_path /home/selab/Desktop/restler-fuzzer/sut_relation_description_new/news_gemini_0528_output.json

# person-controller tree
python3 run_testing.py --testing_type exp3 --service_name person-controller --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/person-controller/ --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_person_controller/Compile_tree/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_person_controller/person_openapi.json --init_dependencies_path /home/selab/Desktop/restler-fuzzer/sut_relation_description_new/person_gemini_0408_output.json

# genome-nexus tree
python3 run_testing.py --testing_type exp3 --service_name genome-nexus --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/genome-nexus/ --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_genome-nexus/Compile_tree/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_genome-nexus/genome_openapi.json --init_dependencies_path /home/selab/Desktop/restler-fuzzer/sut_relation_description_new/genome_gemini_0408_output.json

# features-service aratrl tree
python3 run_testing.py --testing_type exp3 --service_name features-service --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/original/features-service --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/ARAT_RL_features/Compile_tree --api_spec_path /home/selab/Desktop/restler_sut_result/ARAT_RL_features/features.json --init_dependencies_path /home/selab/Desktop/restler-fuzzer/sut_relation_description_new/features_gemini_0408_output.json

# restcountries tree
python3 run_testing.py --testing_type exp3 --service_name restcountries --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/original/restcountries --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_restcountries/Compile_tree/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_restcountries/restcountries_openapi.json --init_dependencies_path /home/selab/Desktop/restler-fuzzer/sut_relation_description_new/restcountries_gemini_0425_output.json

# scs tree
python3 run_testing.py --testing_type exp3 --service_name scs --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/artificial/scs --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_scs/Compile_tree/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_scs/scs_openapi.json --init_dependencies_path /home/selab/Desktop/restler-fuzzer/sut_relation_description_new/scs_0515_output.json
 
# ncs tree
python3 run_testing.py --testing_type exp3 --service_name ncs --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/artificial/ncs --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_ncs/Compile_tree/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_ncs/ncs_openapi.json --init_dependencies_path /home/selab/Desktop/restler-fuzzer/sut_relation_description_new/ncs_0515_output.json

