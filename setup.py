import subprocess, platform, os, webbrowser
system = platform.system().lower()
PARENT_DIR = os.path.dirname(os.path.realpath(__file__))

# # Check if Julia is already installed and accessible
# try:
#     subprocess.run(["julia", "-e", 'println("Status: Julia is WORKING"); exit()'])
#     # exit(0)
# except Exception as e:
#     print("Status: Julia is not installed or not accessible.")

# Install Julia
try:
    # For linux
    if system in ["linux", "linux2"]:
        subprocess.run(["sh", f"{PARENT_DIR}/setup.sh"])
        exit(0)
        
    # For macOS
    elif system == "darwin":
        subprocess.run(["", ""], shell=True)
        
    # For Windows
    elif system == "win32":
        print("Install Julia with this link: https://julialang-s3.julialang.org/bin/winnt/x64/1.8/julia-1.8.5-win64.exe")
        webbrowser.open("https://julialang-s3.julialang.org/bin/winnt/x64/1.8/julia-1.8.5-win64.exe")
        exit(0)
        
except Exception as e:
    print(e)
    print("Error: Failed to install Julia.")

# Check if Julia is installed and accessible through PATH
try:
    subprocess.run(["julia", "-e", 'println("Julia is working"); exit()'])
    exit(0)
except Exception as e:
    print(e)
    print("Error: Julia is not accessible.")
