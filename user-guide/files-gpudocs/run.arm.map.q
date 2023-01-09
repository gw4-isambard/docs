#!/bin/bash
#PBS -N pascalq
#PBS -q pascalq
#PBS -l select=1:ncpus=16:ngpus=1
#PBS -l walltime=00:15:00

set -eu

module purge
module load cuda11.2/toolkit/11.2.0
module use /software/x86/modulefiles
module load tools/arm-forge/20.1
module list

# change WORKDIR to point to your program location
WORKDIR=/home/$USER/gpudocs/profilers/arm/macs
cd $WORKDIR

# compile
nvcc -c -o vector-add.o -g -lineinfo -O3 vector-add.cu
nvcc vector-add.o -o vector-add

# profile
ALLINEA_SAMPLER_INTERVAL=1 map --profile vector-add
