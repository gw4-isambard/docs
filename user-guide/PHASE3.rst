Phase 3 System
------------------------------------

Isambard Phase 3, just like the MACS, hosts many nodes of different architectures:

* 1x Login nodes with `AMD EPYC 7713 64-Core Processor "Milan" <https://www.amd.com/en/products/cpu/amd-epyc-7713>`_ CPU
* 2x nodes of Nvidia Ampere GPU with 4x `Nvidia A100 40GB SXM "Ampere" <https://www.nvidia.com/en-gb/data-center/ampere-architecture/>`_ GPUs and AMD EPYC 7543P 32-Core Processor "Milan" CPU
* 2x nodes of AMD Instinct GPU nodes with 4x `AMD Instinct "MI100" <https://www.amd.com/en/products/server-accelerators/instinct-mi100>`_ GPU and AMD EPYC 7543P 32-Core Processor "Milan" CPU
* 12x nodes dual socket `AMD EPYC 7713 64-Core Processor "Milan" <https://www.amd.com/en/products/cpu/amd-epyc-7713>`_ @ 2.0 GHz, 256 GB/node 16x16GB-DDR4-3200

Phase 3 nodes run Red Hat Enterprise Linux 8 with the Cray software stack.

All nodes are connected via Slingshot 10. The login nodes are connected to the Internet via a 10 Gigabit link to the `Janet Network <https://www.jisc.ac.uk/janet>`_.

Compiling
=========

Compiling can be perfomed on the p3-login node.  Please load the IntelOneApi module for both mpi and compiler

.. code-block:: text
  module load IntelOneApi/compiler
  module load IntelOneApi/mpi

This will make the standard Intel tools available - being AMD processors we recommend using advice from AMD which suggests using

.. code-block:: text
  icc -march core-avx2 

To compile with MPI, the following can be used:

.. code-block:: text
  mpiicc -march core-avx2
  

Running a job
=============

The system can use Intel MPI and Compilers.  For example to run a job on a single node the milanq:

.. code-block:: text

  qsub -q milanq -l select=1:ncpus=128:mpiprocs=128

To run on 2 nodes you could use:

.. code-block:: text
  
  qsub -q milanq -l select=2:ncpus=128:mpiprocs=128 -l place=scatter:excl
  
This will place each request on different nodes - since we have hyperthreading enabled it would otherwise place them on the same node.

  

