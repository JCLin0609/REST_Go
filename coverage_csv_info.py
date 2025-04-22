import csv
from sys import argv
import os
import matplotlib.pyplot as plt
import numpy as np
import argparse

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

def get_coverage_info(csv_file_path):
    # Calculate the total instruction coverage
    total_covered, total_missed = analyze_instruction_covered_sum(csv_file_path)
    total_instruction_coverage = total_covered / (total_covered + total_missed) * 100 if (total_covered + total_missed) > 0 else 0
    
    # Calculate the total line coverage
    total_line_covered, total_line_missed = analyze_line_covered_sum(csv_file_path)
    total_line_coverage = total_line_covered / (total_line_covered + total_line_missed) * 100 if (total_line_covered + total_line_missed) > 0 else 0
    
    # Calculate the total branch coverage
    total_branch_covered, total_branch_missed = analyze_branch_covered_sum(csv_file_path)
    total_branch_coverage = total_branch_covered / (total_branch_covered + total_branch_missed) * 100 if (total_branch_covered + total_branch_missed) > 0 else 0
    
    # Calculate the total method coverage
    total_method_covered, total_method_missed = analyze_method_covered_sum(csv_file_path)
    total_method_coverage = total_method_covered / (total_method_covered + total_method_missed) * 100 if (total_method_covered + total_method_missed) > 0 else 0
    
    return {
        'instruction': total_instruction_coverage,
        'line': total_line_coverage,
        'branch': total_branch_coverage,
        'method': total_method_coverage
    }

def print_coverage_info(csv_file_path):
    # Get the coverage information
    coverage_info = get_coverage_info(csv_file_path)
    
    # Print the coverage information
    print(f"Total instruction coverage: {coverage_info['instruction']:.2f}%")
    print(f"Total branch coverage: {coverage_info['branch']:.2f}%")
    print(f"Total line coverage: {coverage_info['line']:.2f}%") 
    print(f"Total method coverage: {coverage_info['method']:.2f}%")

# Function to plot coverage data comparing different paths
def plot_coverage_comparison(all_data, sut_name):
    # Create one plot for each coverage metric
    metrics = ['instruction', 'line', 'branch', 'method']
    experiment_names = ['Baseline', 'Exp1', 'Exp2', 'Exp3']
    line_styles = ['-', '--', '-.', ':']
    markers = ['o', 's', '^', 'd']
    colors = ['blue', 'red', 'green', 'purple']
    
    # Create a separate plot for each metric
    for metric in metrics:
        plt.figure(figsize=(16, 10))
        
        # Plot data from each experiment path
        for i, exp_data in enumerate(all_data):
            if exp_data['file_numbers'] and exp_data['coverage_data'][metric]:
                plt.plot(
                    exp_data['file_numbers'], 
                    exp_data['coverage_data'][metric], 
                    label=f'{experiment_names[i]}', 
                    marker=markers[i], 
                    linestyle=line_styles[i], 
                    markersize=3,
                    color=colors[i]
                )
        
        # Add labels and title
        plt.xlabel('Test Case Number', fontsize=14)
        plt.ylabel('Coverage (%)', fontsize=14)
        plt.title(f'{metric.capitalize()} Coverage Comparison Across Experiments', fontsize=16)
        plt.legend(fontsize=12)
        plt.grid(True, linestyle='--', alpha=0.7)
        
        # Add x-axis ticks for every 20th file to avoid overcrowding
        max_len = max([len(exp_data['file_numbers']) for exp_data in all_data if exp_data['file_numbers']])
        if max_len > 0:
            tick_interval = 20  # Every 20th file
            tick_positions = list(range(0, max_len, tick_interval))
            # Use the file numbers from the experiment with the most data points
            for exp_data in all_data:
                if len(exp_data['file_numbers']) == max_len:
                    tick_labels = [str(exp_data['file_numbers'][i]) for i in tick_positions if i < len(exp_data['file_numbers'])]
                    break
            plt.xticks(tick_positions, tick_labels)
        
        # Set y-axis limits
        plt.ylim(0, 100)
        
        # Add horizontal grid lines at 20% intervals
        plt.yticks(np.arange(0, 101, 10))
        
        # Create a dedicated folder for the graphs if it doesn't exist
        folder_name = f"coverage_graph_{sut_name}"
        if not os.path.exists(folder_name):
            os.makedirs(folder_name)
            print(f"Created folder '{folder_name}' for storing graphs")
        
        # Save the plot with the metric name in the filename
        filename = f'{sut_name}_{metric}_coverage_comparison'
        plt.savefig(f'{folder_name}/{filename}.png', dpi=300)
        plt.savefig(f'{folder_name}/{filename}.pdf')  # Also save as PDF for better quality
        
        print(f"{metric.capitalize()} coverage comparison graph saved as '{folder_name}/{filename}.png' and '{folder_name}/{filename}.pdf'")
        
        # Show the plot
        plt.show()

# Function to process all files in a sequence
def process_all_files(base_path, start_num, end_num):
    file_numbers = []
    coverage_data = {
        'instruction': [],
        'branch': [],
        'line': [],
        'method': []
    }
    
    for i in range(start_num, end_num + 1):
        file_path = f"{base_path}/report_6300_{i}.csv"
        
        if os.path.exists(file_path):
            try:
                # Get coverage info for this file
                info = get_coverage_info(file_path)
                
                # Record the data
                file_numbers.append(i)
                coverage_data['instruction'].append(info['instruction'])
                coverage_data['line'].append(info['line'])
                coverage_data['branch'].append(info['branch'])
                coverage_data['method'].append(info['method'])
                
            except Exception as e:
                print(f"Error processing file {file_path}: {e}")
        else:
            print(f"Warning: File {file_path} does not exist. Skipping.")
    
    return file_numbers, coverage_data

# Example usage
if __name__ == "__main__":
    # Set up command line argument parsing
    parser = argparse.ArgumentParser(description='Analyze and visualize code coverage from CSV files.')
    parser.add_argument('--name', type=str, default='market', help='Name of the System Under Test (e.g., market, genome, features)')
    parser.add_argument('--baseline', type=str, required=True, help='Path to baseline report CSV files')
    parser.add_argument('--exp1', type=str, required=True, help='Path to experiment 1 report CSV files')
    parser.add_argument('--exp2', type=str, required=True, help='Path to experiment 2 report CSV files')
    parser.add_argument('--exp3', type=str, required=True, help='Path to experiment 3 report CSV files')
    
    args = parser.parse_args()
    
    # Get the SUT name from arguments
    sut_name = args.name
    
    # Set the base paths for the CSV files from arguments
    base_paths = [
        args.baseline,
        args.exp1,
        args.exp2,
        args.exp3
    ]
    
    experiment_names = ['Baseline', 'Exp1_GenAI', 'Exp2_GenAI', 'Exp3_GenAI']
    
    # Process files from start to end numbers
    start_num = 1
    end_num = 180
    
    print(f"Analyzing coverage for SUT: {sut_name}")
    print(f"Processing files {start_num} to {end_num}")
    
    # Collect data from all paths
    all_data = []
    
    # Process each path
    for i, base_path in enumerate(base_paths):
        print(f"\nProcessing experiment: {experiment_names[i]} from path: {base_path}")
        
        # Process all files and get the data
        file_numbers, coverage_data = process_all_files(base_path, start_num, end_num)
        
        # Store the data
        all_data.append({
            'name': experiment_names[i],
            'file_numbers': file_numbers,
            'coverage_data': coverage_data
        })
        
        # Print summary statistics for this experiment
        if file_numbers:
            print(f"\nSummary Statistics for {experiment_names[i]}:")
            for metric in coverage_data:
                values = coverage_data[metric]
                print(f"Average {metric.capitalize()} Coverage: {np.mean(values):.2f}%")
        else:
            print(f"No files were processed successfully for {experiment_names[i]}.")
    
    # Plot comparison graphs for each metric
    plot_coverage_comparison(all_data, sut_name=sut_name)
    
    