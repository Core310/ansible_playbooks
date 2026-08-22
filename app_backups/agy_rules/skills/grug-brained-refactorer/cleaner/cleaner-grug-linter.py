import subprocess
import sys
import argparse
import os

def run_linter(path):
    print(f"Running Pylint Design Checks on {path}...")
    
    # We only care about specific structural/design warnings that indicate over-engineering
    # R0903: Too few public methods (Usually an Executioner class or a class that should be a function)
    # R0201: Method could be a function (Usually unnecessary static methods in a class wrapper)
    # R0904: Too many public methods (God object)
    
    cmd = [
        "pylint",
        "--disable=all",
        "--enable=R0903,R0201,R0904",
        "--msg-template='{path}:{line} - {msg_id}: {msg} ({symbol})'",
        path
    ]
    
    try:
        result = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        output = result.stdout
        
        filtered_lines = [line for line in output.split('\n') if line.strip() and not line.startswith('-')]
        
        if not filtered_lines:
            print("Grug happy! No over-engineering detected by linter.")
            return

        for line in filtered_lines:
            if 'R0903' in line:
                print(f"{line} -> GRUG SAY: Class too small! Just use a function or dict.")
            elif 'R0201' in line:
                print(f"{line} -> GRUG SAY: Unnecessary class wrapper! Extract to flat function.")
            elif 'R0904' in line:
                print(f"{line} -> GRUG SAY: God object detected. Too many methods. Consider breaking down.")
            else:
                print(line)
                
    except FileNotFoundError:
        print("Error: pylint is not installed in this environment. Please run 'pip install pylint' first.")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Run Grug-approved static analysis")
    parser.add_argument("path", help="Directory or file to scan")
    args = parser.parse_args()
    if not os.path.exists(args.path):
        print(f"Path {args.path} does not exist.")
        sys.exit(1)
    run_linter(args.path)
