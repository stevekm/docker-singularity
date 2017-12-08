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

# Resources

http://singularity.lbl.gov/install-linux

https://github.com/singularityware/singularity/releases

https://groups.google.com/a/lbl.gov/forum/#!topic/singularity/e9mlDuzKowc
