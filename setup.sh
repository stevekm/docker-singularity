#!/bin/bash

# set the Singularity demo when the container starts
(
cd singularity-samtools-demo
sudo singularity build singularity-container-samtools Singularity
)
