# market exp2
python3 run_testing.py --testing_type exp2 --service_name market --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk11/market --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_market/Compile_baseline --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_market/market_openapi.json

# user-management exp2
python3 run_testing.py --testing_type exp2 --service_name user-management --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/user-management/ --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_user/Compile_baseline/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_user/user_openapi.json

# project-tracking exp2 aratrl
python3 run_testing.py --testing_type exp2 --service_name project-tracking-system --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk11/project-tracking-system --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/ARAT_RL_project/Compile/ --api_spec_path /home/selab/Desktop/restler_sut_result/ARAT_RL_project/project.json

# news exp2
python3 run_testing.py --testing_type exp2 --service_name news --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/artificial/news --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_news/Compile_baseline/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_news/news_openapi.json

# person-controller exp2
python3 run_testing.py --testing_type exp2 --service_name person-controller --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/person-controller/ --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_person_controller/Compile_baseline/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_person_controller/person_openapi.json

# genome-nexus exp2
python3 run_testing.py --testing_type exp2 --service_name genome-nexus --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/genome-nexus/ --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_genome-nexus/Compile_baseline/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_genome-nexus/genome_openapi.json

# features-service exp2 aratrl
python3 run_testing.py --testing_type exp2 --service_name features-service --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/original/features-service --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/ARAT_RL_features/Compile_baseline --api_spec_path /home/selab/Desktop/restler_sut_result/ARAT_RL_features/features.json

# restcountries exp2
python3 run_testing.py --testing_type exp2 --service_name restcountries --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/original/restcountries --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_restcountries/Compile_baseline/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_restcountries/restcountries_openapi.json

# scs exp2
python3 run_testing.py --testing_type exp2 --service_name scs --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/artificial/scs --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_scs/Compile_baseline/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_scs/scs_openapi.json

# ncs exp2
python3 run_testing.py --testing_type exp2 --service_name ncs --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/artificial/ncs --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_ncs/Compile_baseline/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_ncs/ncs_openapi.json