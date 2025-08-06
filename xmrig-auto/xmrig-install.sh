#!/bin/bash
set -e

echo "Installing dependencies..."
sudo dnf groupinstall "Development Tools" -y
sudo dnf install epel-release -y
sudo dnf install cmake git libmicrohttpd-devel hwloc-devel openssl-devel -y

echo "Cloning xmrig..."
git clone https://github.com/xmrig/xmrig.git
cd xmrig
mkdir build && cd build
cmake ..
make -j$(nproc)

echo "Build complete. Copying binary..."
cp xmrig ../../xmrig
cd ../..