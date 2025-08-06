#!/bin/bash
set -e

echo "Installing dependencies..."
sudo dnf groupinstall "Development Tools" -y
sudo dnf install epel-release -y
sudo dnf install cmake git libmicrohttpd-devel hwloc-devel openssl-devel -y
sudo dnf install libstdc++-static

echo "Cloning xmrig..."
mkdir /etc/projects
echo "created directory /etc/projects"
git clone https://github.com/xmrig/xmrig.git
cd /etc/projects/xmrig
mkdir build && cd build
cmake ..
make -j$(nproc)

echo "Build complete. Copying binary..."
cp xmrig ../../xmrig
cd ../..

cp /etc/projects/xmrig/config.json /etc/projects/xmrig/build/config.json
