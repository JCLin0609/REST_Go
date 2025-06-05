# market baseline
python3 run_testing.py --testing_type baseline --service_name market --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk11/market --restler_py /home/selab/Desktop/restler-fuzzer_baseline/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_market/Compile_baseline/

# market morest
python3 run_testing.py --testing_type morest --service_name market --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk11/market --restler_py /home/selab/Desktop/other/morest/main.py --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_market/market_openapi.yaml --url http://localhost:50117

python main.py --yaml_path /home/selab/Desktop/restler_sut_result/REST_GO_market/market_openapi.yaml --time_budget 10800 --url http://localhost:50117 --output_dir report_market

# market autoresttest
python3 run_testing.py --testing_type autoresttest --service_name market --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk11/market --restler_py  /home/selab/Desktop/other/AutoRestTest/AutoRestTest.py

# market exp1
python3 run_testing.py --testing_type exp1 --service_name market --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk11/market --restler_py /home/selab/Desktop/restler-fuzzer_exp1/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_market/Compile_baseline/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_market/market_openapi.json

# market exp2
python3 run_testing.py --testing_type exp2 --service_name market --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk11/market --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_market/Compile_baseline --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_market/market_openapi.json

# market exp2-1
python3 run_testing.py --testing_type exp2 --service_name market --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk11/market --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_market/Compile_tree --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_market/market_openapi.json

# market tree
python3 run_testing.py --testing_type exp3 --service_name market --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk11/market --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_market/Compile_tree --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_market/market_openapi.json --init_dependencies_path /home/selab/Desktop/restler-fuzzer/sut_relation_description_new/market_gemini_0407_output.json

# features-service baseline
python3 run_testing.py --testing_type baseline --service_name features-service --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/original/features-service --restler_py /home/selab/Desktop/restler-fuzzer_baseline/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/ARAT_RL_features/Compile_baseline

# features-service morest
python3 run_testing.py --testing_type morest --service_name features-service --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/original/features-service --restler_py /home/selab/Desktop/other/morest/main.py --api_spec_path /home/selab/Desktop/restler_sut_result/ARAT_RL_features/features.yaml --url http://localhost:50100

python main.py --yaml_path /home/selab/Desktop/restler_sut_result/ARAT_RL_features/features.yaml --time_budget 10800 --url http://localhost:50100 --output_dir report_features

# features-service autoresttest
python3 run_testing.py --testing_type autoresttest --service_name features-service --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/original/features-service --restler_py  /home/selab/Desktop/other/AutoRestTest/AutoRestTest.py

# features-service exp1
python3 run_testing.py --testing_type exp1 --service_name features-service --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/original/features-service --restler_py /home/selab/Desktop/restler-fuzzer_exp1/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/ARAT_RL_features/Compile_baseline --api_spec_path /home/selab/Desktop/restler_sut_result/ARAT_RL_features/features.json

# features-service exp2
python3 run_testing.py --testing_type exp2 --service_name features-service --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/original/features-service --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/ARAT_RL_features/Compile_baseline --api_spec_path /home/selab/Desktop/restler_sut_result/ARAT_RL_features/features.json

# features-service aratrl exp2-1
python3 run_testing.py --testing_type exp2 --service_name features-service --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/original/features-service --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/ARAT_RL_features/Compile_tree --api_spec_path /home/selab/Desktop/restler_sut_result/ARAT_RL_features/features.json

# features-service tree
python3 run_testing.py --testing_type exp3 --service_name features-service --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/original/features-service --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_feature-service/Compile_tree --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_feature-service/features_openapi.json --init_dependencies_path /home/selab/Desktop/restler-fuzzer/sut_relation_description_new/features_gemini_0408_output.json

# features-service aratrl tree
python3 run_testing.py --testing_type exp3 --service_name features-service --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/original/features-service --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/ARAT_RL_features/Compile_tree --api_spec_path /home/selab/Desktop/restler_sut_result/ARAT_RL_features/features.json --init_dependencies_path /home/selab/Desktop/restler-fuzzer/sut_relation_description_new/features_gemini_0408_output.json

# person-controller baseline
python3 run_testing.py --testing_type baseline --service_name person-controller --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/person-controller/ --restler_py /home/selab/Desktop/restler-fuzzer_baseline/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_person_controller/Compile_baseline/ 

# person-controller morest
python3 run_testing.py --testing_type morest --service_name person-controller --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/person-controller/ --restler_py /home/selab/Desktop/other/morest/main.py --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_person_controller/person_openapi.yaml --url http://localhost:50111

python main.py --yaml_path /home/selab/Desktop/restler_sut_result/REST_GO_person_controller/person_openapi.yaml --time_budget 10800 --url http://localhost:50111 --output_dir report_person

# person-controller autoresttest
python3 run_testing.py --testing_type autoresttest --service_name person-controller --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/person-controller/ --restler_py  /home/selab/Desktop/other/AutoRestTest/AutoRestTest.py

# person-controller exp1
python3 run_testing.py --testing_type exp1 --service_name person-controller --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/person-controller/ --restler_py /home/selab/Desktop/restler-fuzzer_exp1/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_person_controller/Compile_baseline/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_person_controller/person_openapi.json

# person-controller exp2
python3 run_testing.py --testing_type exp2 --service_name person-controller --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/person-controller/ --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_person_controller/Compile_baseline/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_person_controller/person_openapi.json

# person-controller exp2-1
python3 run_testing.py --testing_type exp2 --service_name person-controller --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/person-controller/ --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_person_controller/Compile_tree/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_person_controller/person_openapi.json

# person-controller tree
python3 run_testing.py --testing_type exp3 --service_name person-controller --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/person-controller/ --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_person_controller/Compile_tree/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_person_controller/person_openapi.json --init_dependencies_path /home/selab/Desktop/restler-fuzzer/sut_relation_description_new/person_gemini_0408_output.json

# user-management baseline
python3 run_testing.py --testing_type baseline --service_name user-management --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/user-management/ --restler_py /home/selab/Desktop/restler-fuzzer_baseline/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_user/Compile_baseline

# user-management morest
python3 run_testing.py --testing_type morest --service_name user-management --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/user-management/ --restler_py /home/selab/Desktop/other/morest/main.py --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_user/user_openapi.yaml --url http://localhost:50115

python main.py --yaml_path /home/selab/Desktop/restler_sut_result/REST_GO_user/user_openapi.yaml --time_budget 10800 --url http://localhost:50115 --output_dir report_user

# user-management autoresttest
python3 run_testing.py --testing_type autoresttest --service_name user-management --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/user-management/ --restler_py  /home/selab/Desktop/other/AutoRestTest/AutoRestTest.py

# user-management exp1
python3 run_testing.py --testing_type exp1 --service_name user-management --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/user-management/ --restler_py /home/selab/Desktop/restler-fuzzer_exp1/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_user/Compile_baseline/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_user/user_openapi.json

# user-management exp2
python3 run_testing.py --testing_type exp2 --service_name user-management --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/user-management/ --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_user/Compile_baseline/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_user/user_openapi.json

# user-management exp2-1
python3 run_testing.py --testing_type exp2 --service_name user-management --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/user-management/ --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_user/Compile_tree/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_user/user_openapi.json

# user-management tree
python3 run_testing.py --testing_type exp3 --service_name user-management --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/user-management/ --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_user/Compile_tree/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_user/user_openapi.json --init_dependencies_path /home/selab/Desktop/restler-fuzzer/sut_relation_description_new/user_gemini_0408_output.json

# genome-nexus baseline
python3 run_testing.py --testing_type baseline --service_name genome-nexus --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/genome-nexus/ --restler_py /home/selab/Desktop/restler-fuzzer_baseline/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_genome-nexus/Compile_baseline/

# genome-nexus morest
python3 run_testing.py --testing_type morest --service_name genome-nexus --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/genome-nexus/ --restler_py /home/selab/Desktop/other/morest/main.py --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_genome-nexus/genome_openapi.yaml --url http://localhost:50110

# genome-nexus autoresttest
python3 run_testing.py --testing_type autoresttest --service_name genome-nexus --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/genome-nexus/ --restler_py  /home/selab/Desktop/other/AutoRestTest/AutoRestTest.py

# genome-nexus exp1
python3 run_testing.py --testing_type exp1 --service_name genome-nexus --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/genome-nexus/ --restler_py /home/selab/Desktop/restler-fuzzer_exp1/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_genome-nexus/Compile_baseline/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_genome-nexus/genome_openapi.json

# genome-nexus exp2
python3 run_testing.py --testing_type exp2 --service_name genome-nexus --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/genome-nexus/ --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_genome-nexus/Compile_baseline/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_genome-nexus/genome_openapi.json

# genome-nexus exp2-1
python3 run_testing.py --testing_type exp2 --service_name genome-nexus --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/genome-nexus/ --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_genome-nexus/Compile_tree/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_genome-nexus/genome_openapi.json

# genome-nexus tree
python3 run_testing.py --testing_type exp3 --service_name genome-nexus --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk8/genome-nexus/ --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_genome-nexus/Compile_tree/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_genome-nexus/genome_openapi.json --init_dependencies_path /home/selab/Desktop/restler-fuzzer/sut_relation_description_new/genome_gemini_0408_output.json

# restcountries baseline
python3 run_testing.py --testing_type baseline --service_name restcountries --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/original/restcountries --restler_py /home/selab/Desktop/restler-fuzzer_baseline/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_restcountries/Compile_baseline/

# restcountries morest
python3 run_testing.py --testing_type morest --service_name restcountries --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/original/restcountries --restler_py /home/selab/Desktop/other/morest/main.py --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_restcountries/restcountries_openapi.yaml --url http://localhost:50106/rest

python main.py --yaml_path /home/selab/Desktop/restler_sut_result/REST_GO_restcountries/restcountries_openapi.yaml --time_budget 10800 --url http://localhost:50106/rest --output_dir report_restcountries

# restcountries autoresttest
python3 run_testing.py --testing_type autoresttest --service_name restcountries --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/original/restcountries --restler_py  /home/selab/Desktop/other/AutoRestTest/AutoRestTest.py

# restcountries exp1
python3 run_testing.py --testing_type exp1 --service_name restcountries --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/original/restcountries --restler_py /home/selab/Desktop/restler-fuzzer_exp1/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_restcountries/Compile_baseline/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_restcountries/restcountries_openapi.json

# restcountries exp2
python3 run_testing.py --testing_type exp2 --service_name restcountries --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/original/restcountries --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_restcountries/Compile_baseline/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_restcountries/restcountries_openapi.json

# restcountries exp2-1
python3 run_testing.py --testing_type exp2 --service_name restcountries --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/original/restcountries --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_restcountries/Compile_tree/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_restcountries/restcountries_openapi.json

# restcountries tree
python3 run_testing.py --testing_type exp3 --service_name restcountries --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/original/restcountries --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_restcountries/Compile_tree/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_restcountries/restcountries_openapi.json --init_dependencies_path /home/selab/Desktop/restler-fuzzer/sut_relation_description_new/restcountries_gemini_0425_output.json

# project-tracking baseline
python3 run_testing.py --testing_type baseline --service_name project-tracking-system --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk11/project-tracking-system --restler_py /home/selab/Desktop/restler-fuzzer_baseline/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/ARAT_RL_project/Compile/

# project-tracking morest
python3 run_testing.py --testing_type morest --service_name project-tracking-system --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk11/project-tracking-system --restler_py /home/selab/Desktop/other/morest/main.py --api_spec_path /home/selab/Desktop/other/AutoRestTest/aratrl-openapi/project.yaml --url http://localhost:50118

python main.py --yaml_path /home/selab/Desktop/other/AutoRestTest/aratrl-openapi/project.yaml --time_budget 10800 --url http://localhost:50118 --output_dir report_project

# project-tracking autoresttest
python3 run_testing.py --testing_type autoresttest --service_name project-tracking-system --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk11/project-tracking-system --restler_py  /home/selab/Desktop/other/AutoRestTest/AutoRestTest.py

# project-tracking exp1
python3 run_testing.py --testing_type exp1 --service_name project-tracking-system --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk11/project-tracking-system --restler_py /home/selab/Desktop/restler-fuzzer_exp1/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/ARAT_RL_project/Compile/ --api_spec_path /home/selab/Desktop/restler_sut_result/ARAT_RL_project/project.json

# project-tracking exp2
python3 run_testing.py --testing_type exp2 --service_name project-tracking-system --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk11/project-tracking-system --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/ARAT_RL_project/Compile/ --api_spec_path /home/selab/Desktop/restler_sut_result/ARAT_RL_project/project.json

# project-tracking exp2-1 aratrl
python3 run_testing.py --testing_type exp2 --service_name project-tracking-system --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk11/project-tracking-system --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/ARAT_RL_project/Compile_tree --api_spec_path /home/selab/Desktop/restler_sut_result/ARAT_RL_project/project.json

# project-tracking tree
python3 run_testing.py --testing_type exp3 --service_name project-tracking-system --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk11/project-tracking-system --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_project/Compile_tree --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_project/project_swagger.json --init_dependencies_path /home/selab/Desktop/restler-fuzzer/sut_relation_description_new/project_gemini_0425_output.json

# project-tracking tree aratrl
python3 run_testing.py --testing_type exp3 --service_name project-tracking-system --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/jdk11/project-tracking-system --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/ARAT_RL_project/Compile_tree --api_spec_path /home/selab/Desktop/restler_sut_result/ARAT_RL_project/project.json --init_dependencies_path /home/selab/Desktop/restler-fuzzer/sut_relation_description_new/project_gemini_0425_output.json

# scs baseline
python3 run_testing.py --testing_type baseline --service_name scs --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/artificial/scs --restler_py /home/selab/Desktop/restler-fuzzer_baseline/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_scs/Compile_baseline/

# scs morest
python3 run_testing.py --testing_type morest --service_name scs --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/artificial/scs --restler_py /home/selab/Desktop/other/morest/main.py --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_scs/scs_openapi.yaml --url http://localhost:50108

python main.py --yaml_path /home/selab/Desktop/restler_sut_result/REST_GO_scs/scs_openapi.yaml --time_budget 10800 --url http://localhost:50108 --output_dir report_scs

# scs autoresttest
python3 run_testing.py --testing_type autoresttest --service_name scs --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/artificial/scs --restler_py  /home/selab/Desktop/other/AutoRestTest/AutoRestTest.py

# scs exp1
python3 run_testing.py --testing_type exp1 --service_name scs --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/artificial/scs --restler_py /home/selab/Desktop/restler-fuzzer_exp1/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_scs/Compile_baseline/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_scs/scs_openapi.json

# scs exp2
python3 run_testing.py --testing_type exp2 --service_name scs --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/artificial/scs --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_scs/Compile_baseline/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_scs/scs_openapi.json

# scs exp2-1
python3 run_testing.py --testing_type exp2 --service_name scs --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/artificial/scs --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_scs/Compile_tree/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_scs/scs_openapi.json

# scs tree
python3 run_testing.py --testing_type exp3 --service_name scs --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/artificial/scs --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_scs/Compile_tree/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_scs/scs_openapi.json --init_dependencies_path /home/selab/Desktop/restler-fuzzer/sut_relation_description_new/scs_0515_output.json

# ncs baseline
python3 run_testing.py --testing_type baseline --service_name ncs --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/artificial/ncs --restler_py /home/selab/Desktop/restler-fuzzer_baseline/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_ncs/Compile_baseline/

# ncs morest
python3 run_testing.py --testing_type morest --service_name ncs --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/artificial/ncs --restler_py /home/selab/Desktop/other/morest/main.py --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_ncs/ncs_openapi.yaml --url http://localhost:50102

python main.py --yaml_path /home/selab/Desktop/restler_sut_result/REST_GO_ncs/ncs_openapi.yaml --time_budget 10800 --url http://localhost:50102 --output_dir report_ncs

# ncs autoresttest
python3 run_testing.py --testing_type autoresttest --service_name ncs --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/artificial/ncs --restler_py  /home/selab/Desktop/other/AutoRestTest/AutoRestTest.py

# ncs exp1
python3 run_testing.py --testing_type exp1 --service_name ncs --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/artificial/ncs --restler_py /home/selab/Desktop/restler-fuzzer_exp1/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_ncs/Compile_baseline/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_ncs/ncs_openapi.json

# ncs exp2
python3 run_testing.py --testing_type exp2 --service_name ncs --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/artificial/ncs --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_ncs/Compile_baseline/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_ncs/ncs_openapi.json

# ncs exp2-1
python3 run_testing.py --testing_type exp2 --service_name ncs --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/artificial/ncs --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_ncs/Compile_tree/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_ncs/ncs_openapi.json

# ncs tree
python3 run_testing.py --testing_type exp3 --service_name ncs --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/artificial/ncs --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_ncs/Compile_tree/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_ncs/ncs_openapi.json --init_dependencies_path /home/selab/Desktop/restler-fuzzer/sut_relation_description_new/ncs_0515_output.json

# news baseline
python3 run_testing.py --testing_type baseline --service_name news --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/artificial/news --restler_py /home/selab/Desktop/restler-fuzzer_baseline/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_news/Compile_baseline

# news morest
python3 run_testing.py --testing_type morest --service_name news --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/artificial/news --restler_py /home/selab/Desktop/other/morest/main.py --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_news/news_openapi.yaml --url http://localhost:50103

python main.py --yaml_path /home/selab/Desktop/restler_sut_result/REST_GO_news/news_openapi.yaml --time_budget 10800 --url http://localhost:50103 --output_dir report_news

# news autoresttest
python3 run_testing.py --testing_type autoresttest --service_name news --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/artificial/news --restler_py  /home/selab/Desktop/other/AutoRestTest/AutoRestTest.py

# news exp1
python3 run_testing.py --testing_type exp1 --service_name news --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/artificial/news --restler_py /home/selab/Desktop/restler-fuzzer_exp1/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_news/Compile_baseline/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_news/news_openapi.json

# news exp2
python3 run_testing.py --testing_type exp2 --service_name news --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/artificial/news --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_news/Compile_baseline/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_news/news_openapi.json

# news exp2-1
python3 run_testing.py --testing_type exp2 --service_name news --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/artificial/news --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_news/Compile_tree/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_news/news_openapi.json

# news exp3
python3 run_testing.py --testing_type exp3 --service_name news --port 6300 --type blackbox --time_budget 180 --source_code_path /home/selab/Desktop/REST_Go/services/evo_jdk8/cs/rest/artificial/news --restler_py /home/selab/Desktop/restler-fuzzer/restler/restler.py --restler_compile_dir /home/selab/Desktop/restler_sut_result/REST_GO_news/Compile_tree/ --api_spec_path /home/selab/Desktop/restler_sut_result/REST_GO_news/news_openapi.json --init_dependencies_path /home/selab/Desktop/restler-fuzzer/sut_relation_description_new/news_gemini_0528_output.json