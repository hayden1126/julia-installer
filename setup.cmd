:: If curl command is accessible, use it to download https://julialang-s3.julialang.org/bin/winnt/x64/1.8/julia-1.8.5-win64.exe
:: Otherwise, use the Windows command line to download the file
:: If neither is available, exit with an error
if exist "C:\Program Files\Git\usr\bin\curl.exe" (
    C:\Program Files\Git\usr\bin\curl.exe -L -o julia-1.8.5-win64.exe https://julialang-s3.julialang.org/bin/winnt/x64/1.8/julia-1.8.5-win64.exe
) else if exist "C:\Windows\System32\curl.exe" (
    C:\Windows\System32\curl.exe -L -o julia-1.8.5-win64.exe https://julialang-s3.julialang.org/bin/winnt/x64/1.8/julia-1.8.5-win64.exe
) else (
    echo "ERROR: Neither curl.exe nor git.exe is available"
    exit /b 1
)