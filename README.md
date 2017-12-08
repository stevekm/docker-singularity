# docker-singularity

A Docker container with Singularity installed

For testing Singularity containers on systems without Singularity


# Build Docker Container

```bash
git clone https://github.com/stevekm/docker-singularity.git
cd docker-singularity
docker build -t stevekm/singularity .
```

# Run Docker Container

```bash
docker run --privileged --rm -ti stevekm/singularity
```




# Notes

To run a Docker base image directly:

```
docker run --privileged --rm -ti debian:jessie /bin/bash
```
## Setup Base Image

```bash
apt-get update
apt-get -y install wget
apt-get -y install gcc
apt-get install -y python
apt-get install -y make
apt-get -y install sudo
apt-get -y install git
apt-get install -y squashfs-tools
```

## Install Singularity

```bash
# VERSION=2.3.1
VERSION=2.4
wget https://github.com/singularityware/singularity/releases/download/$VERSION/singularity-$VERSION.tar.gz
tar xvf singularity-$VERSION.tar.gz
cd singularity-$VERSION
./configure --prefix=/usr/local
make
sudo make install
```

## Demo Singularity Container (inside the Docker container)

```bash
# build Singularity container
cd /
git clone https://github.com/stevekm/singularity-samtools-demo.git

cd singularity-samtools-demo

sudo singularity build singularity-container-samtools Singularity

# run
singularity exec singularity-container-samtools samtools --version
singularity exec singularity-container-samtools samtools view input/HapMap-B17-1267.bam
```

# Resources

http://singularity.lbl.gov/install-linux

https://github.com/singularityware/singularity/releases

https://groups.google.com/a/lbl.gov/forum/#!topic/singularity/e9mlDuzKowc
