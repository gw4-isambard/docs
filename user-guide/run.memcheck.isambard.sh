#!/bin/bash
#PBS -N pascalq
#PBS -q pascalq
#PBS -l select=1:ncpus=18:ngpus=1
#PBS -l walltime=00:15:00

set -eu

module purge
module load cuda11.2/toolkit/11.2.0
module list

code=memcheck_demo
logfile=memcheck_demo.${PBS_JOBID}.log

echo $PWD
cp $PBS_O_WORKDIR/$code .

compute-sanitizer --log-file=$logfile --destroy-on-device-error kernel --leak-check full --tool memcheck $code

mv $logfile $PBS_O_WORKDIR
