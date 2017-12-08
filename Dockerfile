# Docker container with Singularity installed
FROM debian:jessie

MAINTAINER Stephen M. Kelly

# install required dependencies
RUN apt-get update
RUN apt-get -y install wget
RUN apt-get -y install gcc
RUN apt-get install -y python
RUN apt-get install -y make
RUN apt-get -y install sudo
RUN apt-get -y install git
RUN apt-get install -y squashfs-tools

# install Singularity
ENV VERSION=2.4
RUN wget https://github.com/singularityware/singularity/releases/download/$VERSION/singularity-$VERSION.tar.gz
RUN tar xvf singularity-$VERSION.tar.gz
RUN cd singularity-$VERSION && ./configure --prefix=/usr/local && make && sudo make install

# clone the Singularity demo repo
RUN git clone https://github.com/stevekm/singularity-samtools-demo.git

# add the start script
ADD setup.sh /setup.sh
RUN chmod +x /setup.sh

# add the test script
ADD test.sh /test.sh
RUN chmod +x /test.sh

# Container Startup Commands; build the Singularity container at run time
CMD bash -C '/setup.sh'; bash
