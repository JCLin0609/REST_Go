import csv
from sys import argv
import os

# Function to analyze the sum of column "instruction_covered"
def analyze_instruction_covered_sum(csv_file_path):
    total_instruction_covered = 0
    total_instruction_missed = 0
    with open(csv_file_path, mode='r') as file:
        csv_reader = csv.DictReader(file)
        for row in csv_reader:
            total_instruction_covered += int(row['INSTRUCTION_COVERED'])
    with open(csv_file_path, mode='r') as file:
        csv_reader = csv.DictReader(file)
        for row in csv_reader:
            total_instruction_missed += int(row['INSTRUCTION_MISSED']) 
    return total_instruction_covered, total_instruction_missed

# Function to analyze the sum of column "line_covered"
def analyze_line_covered_sum(csv_file_path):
    total_line_covered = 0
    total_line_missed = 0
    with open(csv_file_path, mode='r') as file:
        csv_reader = csv.DictReader(file)
        for row in csv_reader:
            total_line_covered += int(row['LINE_COVERED'])
    with open(csv_file_path, mode='r') as file:
        csv_reader = csv.DictReader(file)
        for row in csv_reader:
            total_line_missed += int(row['LINE_MISSED']) 
    return total_line_covered, total_line_missed

# Function to analyze the sum of column "branch_covered"
def analyze_branch_covered_sum(csv_file_path):
    total_branch_covered = 0
    total_branch_missed = 0
    with open(csv_file_path, mode='r') as file:
        csv_reader = csv.DictReader(file)
        for row in csv_reader:
            total_branch_covered += int(row['BRANCH_COVERED'])
    with open(csv_file_path, mode='r') as file:
        csv_reader = csv.DictReader(file)
        for row in csv_reader:
            total_branch_missed += int(row['BRANCH_MISSED']) 
    return total_branch_covered, total_branch_missed

# Function to analyze the sum of column "Method_covered"
def analyze_method_covered_sum(csv_file_path):
    total_method_covered = 0
    total_method_missed = 0
    with open(csv_file_path, mode='r') as file:
        csv_reader = csv.DictReader(file)
        for row in csv_reader:
            total_method_covered += int(row['METHOD_COVERED'])
    with open(csv_file_path, mode='r') as file:
        csv_reader = csv.DictReader(file)
        for row in csv_reader:
            total_method_missed += int(row['METHOD_MISSED']) 
    return total_method_covered, total_method_missed

def print_coverage_info(csv_file_path):
    # Calculate the total instruction coverage
    total_covered, total_missed = analyze_instruction_covered_sum(csv_file_path)
    total_coverage = total_covered / (total_covered + total_missed) * 100
    print(f"Total instruction covered: {total_covered}, Total instruction missed: {total_missed}.")
    print(f"Total instruction coverage: {total_coverage}%\n")
    
    # Calculate the total line coverage
    total_line_covered, total_line_missed = analyze_line_covered_sum(csv_file_path)
    total_line_coverage = total_line_covered / (total_line_covered + total_line_missed) * 100
    print(f"Total line covered: {total_line_covered}, Total line missed: {total_line_missed}.") 
    print(f"Total line coverage: {total_line_coverage}%\n")
    
    # Calculate the total branch coverage
    total_branch_covered, total_branch_missed = analyze_branch_covered_sum(csv_file_path)
    total_branch_coverage = total_branch_covered / (total_branch_covered + total_branch_missed) * 100
    print(f"Total branch covered: {total_branch_covered}, Total branch missed: {total_branch_missed}.")
    print(f"Total branch coverage: {total_branch_coverage}%\n")
    
    # Calculate the total method coverage
    total_method_covered, total_method_missed = analyze_method_covered_sum(csv_file_path)
    total_method_coverage = total_method_covered / (total_method_covered + total_method_missed) * 100
    print(f"Total method covered: {total_method_covered}, Total method missed: {total_method_missed}.")
    print(f"Total method coverage: {total_method_coverage}%")

# Example usage
if __name__ == "__main__":
    coverage_file = argv[1]
    csv_file_path = coverage_file  # Use the argument passed from the command line
    
    if not os.path.exists(csv_file_path):
        print(f"Error: The file {csv_file_path} does not exist.")
    else:
        print_coverage_info(csv_file_path)
    
    