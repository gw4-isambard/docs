#!/bin/bash --login
#PBS -N dlmnote_job

# Select 1 nodes (maximum of 64 cores)
#PBS -l select=1:ncpus=64

# Select wall time 10 hours
#PBS -l walltime=10:0:0

# Use the arm nodes
#PBS -q arm

# Load modules for currently recommended VASP build - see build instructions for more info
module swap PrgEnv-cray PrgEnv-gnu

# Move to directory that script was submitted from
export PBS_O_WORKDIR=$(readlink -f $PBS_O_WORKDIR)
export OMP_NUM_THREADS=1
cd $PBS_O_WORKDIR

# XC requires use of aprun to launch job on compute notes
# Isambard is configured to only allow a single aprun instance per user per node.
# If you wish to run production workloads on Isambard you will need a taskfarmer.
aprun -n 1 DL_MONTE-SRL.X
