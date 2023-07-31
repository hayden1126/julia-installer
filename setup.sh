#!/bin/sh

# Checks if Julia is already installed
echo "Checking for Julia..."
if [ -x "$(command -v julia)" ]; then
    echo "Julia is already installed."
    exit 0
fi

version="1.8.5"

# Downloads the installer with wget or curl
if [ -x "$(command -v wget)" ]; then
    echo Downloading from https://julialang-s3.julialang.org/bin/linux/x64/1.8/julia-$version-linux-x86_64.tar.gz with wget...
    wget https://julialang-s3.julialang.org/bin/linux/x64/1.8/julia-$version-linux-x86_64.tar.gz
elif [ -x "$(command -v curl)" ]; then
    echo Downloading from https://julialang-s3.julialang.org/bin/linux/x64/1.8/julia-$version-linux-x86_64.tar.gz with curl...
    curl -O https://julialang-s3.julialang.org/bin/linux/x64/1.8/julia-$version-linux-x86_64.tar.gz
else
    echo "Error: wget and curl are not available." >&2
    exit 1
fi

# Extracts the installer with tar
if [ -x "$(command -v tar)" ]; then
    echo Extracting...
    tar -xzf julia-$version-linux-x86_64.tar.gz
    rm julia-$version-linux-x86_64.tar.gz
else
    echo "Error: tar is not available." >&2
    exit 1
fi

# Moves the extracted folder to /opt/ and creates a symlink to the julia executable
if [ -x "$(command -v sudo)" ]; then
    echo Moving to /opt/...
    sudo mkdir -p /opt/
    sudo cp -r julia-$version /opt/
    echo Creating symlink to /usr/local/bin/...
    sudo mkdir -p /usr/local/bin/
    sudo ln -s /opt/julia-$version/bin/julia /usr/local/bin/julia
else
    echo "Error: User has no permissions." >&2
    exit 1
fi

# Checks if Julia is installed
if [ -x "$(command -v julia)" ]; then
    echo "Julia is installed."
    exit 0
else
    echo "Error: Julia is not accessible." >&2
    exit 1
fi