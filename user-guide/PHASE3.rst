Phase 3 System
------------------------------------

.. important::
    On Tuesday June 4th 2024 at 9am "PHASE 3" will be switched OFF and will be moved to Bristol to be part of Isambard 3 which will be launched over the summer.

Isambard Phase 3, just like the MACS, hosts many nodes of different architectures:

* 1x Login nodes with `AMD EPYC 7713 64-Core Processor "Milan" <https://www.amd.com/en/products/cpu/amd-epyc-7713>`_ CPU
* 2x nodes of Nvidia Ampere GPU with 4x `Nvidia A100 40GB SXM "Ampere" <https://www.nvidia.com/en-gb/data-center/ampere-architecture/>`_ GPUs and AMD EPYC 7543P 32-Core Processor "Milan" CPU
* 2x nodes of AMD Instinct GPU nodes with 4x `AMD Instinct "MI100" <https://www.amd.com/en/products/server-accelerators/instinct-mi100>`_ GPU and AMD EPYC 7543P 32-Core Processor "Milan" CPU
* 12x nodes dual socket `AMD EPYC 7713 64-Core Processor "Milan" <https://www.amd.com/en/products/cpu/amd-epyc-7713>`_ @ 2.0 GHz, 256 GB/node 16x16GB-DDR4-3200

Phase 3 nodes run Red Hat Enterprise Linux 8 with the Cray software stack.

All nodes are connected via Slingshot 10. The login nodes are connected to the Internet via a 10 Gigabit link to the `Janet Network <https://www.jisc.ac.uk/janet>`_.

Lustre Storage
==============

Due to migration to newer storage old data can found read-only at /lustreOld
e.g. previous home directory at /lustreOld/home

We have already copied over software from /lustreOld/software/x86 to the new
/lustre location.

Nvidia GPU
==========

There is a Nvidia SDK install on each of the `ampereq` nodes in `/opt/nvidia` but you can also load a latest version using:

.. code-block:: text

  module use /software/x86/tools/nvidia/hpc_sdk/modulefiles
  module load nvhpc/22.9

To submit a job with 1 GPU and 1 CPU use:

.. code-block:: text

  qsub -I -q ampereq -l select=1:ncpus=1:ngpus=1:mem=100G
  
This sets `CUDA_VISIBLE_DEVICES` to a UUID (unique id) of a GPU that PBS provided you and sets 100GB of memory along with 1 CPU.

AMD GPU
=======

There is a AMD ROCM install on each `instinctq` nodes in `/opt/rocm` but you can also use the Cray compiler.

.. code-block:: text

  module load craype-accel-amd-gfx908

To submit a job with 1 GPU and 1 CPU use:

.. code-block:: text

  qsub -I -q instinctq -l select=1:ncpus=1 -l place=excl

For now the PBS is not setup to support reserving AMD GPUs so we ask users to exclusively use the node (with `-l place=excl`) and not specify `ngpus` in the resource line.

Cray Compiler
=============

Compiling
~~~~~~~~~

Compiling can be perfomed on the p3-login node.

The default modules should provide the required environment.

.. code-block:: text

  cc test.c 

To compile with MPI and OpenMP, the following can be used:

.. code-block:: text

  cc -h omp test.c
  

Running a job
~~~~~~~~~~~~~

For example to run a job on a single node the milanq:

.. code-block:: text

  qsub -q milanq -l select=1:ncpus=128:mpiprocs=128

To run on 2 nodes you could use:

.. code-block:: text
  
  qsub -q milanq -l select=2:ncpus=128:mpiprocs=128 -l place=scatter:excl
  
This will place each request on different nodes - since we have hyperthreading enabled it would otherwise place them on the same node.

Then use Cray module to launch the MPI job

.. code-block:: text
  
  module load cray-pals
  mpirun hostname

Intel OneAPI
============

Compiling
~~~~~~~~~

Compiling can be perfomed on the p3-login node.  

Please load the IntelOneApi module for both mpi and compiler

.. code-block:: text

  module load IntelOneApi/compiler
  module load IntelOneApi/mpi

This will make the standard Intel tools available - being AMD processors we recommend using advice from AMD which suggests using

.. code-block:: text

  icc -march core-avx2 

To compile with MPI, the following can be used:

.. code-block:: text

  mpiicc -march core-avx2 -fopenmp
  

Running a job
~~~~~~~~~~~~~

The system can use Intel MPI and related Compilers (load modules as above).  For example to run a job on a single node the milanq:

.. code-block:: text

  qsub -q milanq -l select=1:ncpus=128:mpiprocs=128

To run on 2 nodes you could use:

.. code-block:: text
  
  qsub -q milanq -l select=2:ncpus=128:mpiprocs=128 -l place=scatter:excl
  
This will place each request on different nodes - since we have hyperthreading enabled it would otherwise place them on the same node.

Then use ssh to laucnh the MPI job

.. code-block:: text
  
  mpirun -launcher ssh hostname

Apptainer/Singularity
=====================

To allow containers to run on the system, which is common for GPU applications, we have installed apptainer (fork from original Singularity project).

Nvidia
~~~~~~~~~~~~~

For example to download a Nvidia Tensorflow container run on the login node:

.. code-block:: text

  apptainer pull docker://nvcr.io/nvidia/tensorflow:23.11-tf2-py3

To run this on a Nvidia GPU

.. code-block:: text

  qsub -I -q ampereq -l select=1:ngpus=1:mem=64g

Then run on the compute node:

.. code-block:: text

  apptainer shell tensorflow_23.11-tf2-py3.sif

Due to issue with initialisation of these containers with apptainer, rerun a script:

.. code-block:: text

  source /etc/shinit_v2

Then run `python3` with some Tensorflow code.

AMD
~~~

Similar can be done on AMD GPUs in instinctq downloading container on login node:

.. code-block:: text

  apptainer pull docker://rocm/tensorflow

Then run on the AMD GPU queue.

.. code-block:: text

  qsub -I -q instinctq -l select=1:mem=64g -l place=excl

Finally run the container

.. code-block:: text

  apptainer shell tensorflow_latest.sif

And then turn `python3`
