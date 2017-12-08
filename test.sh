#!/bin/bash

# script to test the Singularity container
cd singularity-samtools-demo
singularity exec singularity-container-samtools samtools --version
singularity exec singularity-container-samtools samtools view input/HapMap-B17-1267.bam
