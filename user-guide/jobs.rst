Running jobs
------------

Isambard uses the PBS Pro scheduler to manage compute resources and run jobs according to "fairshare" rather than fixed allocations.

The MACS, XCI & A64FX use separate schedulers, jobs must be submitted from the login nodes for the relevant system.

Limits
======

Users can submit any number of jobs but only two jobs per-user per-queue will run at the same time.

Queue configuration
===================

* `arm`     - Run on XCI Marvell Thunder X2 nodes
* `arm-dev` - Run interactively on up to 4x XCI Thunder X2 nodes
* `romeq`    - Run on MACS 4x AMD Epyc "Rome" 7742 nodes
* `clxq`    - Run on MACS 4x Intel Xeon 6230 "Cascade Lake" (CLX) nodes
* `voltaq`  - Run on MACS 4x Nvidia Tesla V100 "Volta" GPU nodes
* `pascalq` - Run on MACS 4x dual-card Nvidia Tesla P100 "Pascal" GPU nodes
* `knlq`    - Run on MACS 8x Intel Xeon Phi "Knights Landing" 7210 CPU nodes
* `powerq`  - Run on MACS 2x IBM Power 9 nodes, each with dual-card Nvidia V100 "Volta" GPUs ← ``Queue unavailable, interactive use only, hosts: power-001, power-002``

`knlq` is split into two sets of MCDRAM configuration, nodes 001-004 are in cache memory mode (quad_0) and nodes 005-008 are in flat memory mode (quad_100). These modes can be targeted using the ``aoe=`` PBS attribute.

To see the available queues and their current state:

.. code-block:: bash

  qstat -q

Batch job
=========

Phase 1 example:

.. code-block:: bash

 #!/bin/bash
 #PBS -q pascalq
 #PBS -l select=2
 #PBS -l walltime=00:01:00
 
 module load intel-parallel-studio-xe/compilers/64
 mpirun hostname

Phase 2 XC50 example:

.. code-block:: bash

 #!/bin/bash
 #PBS -q arm
 #PBS -l select=2
 #PBS -l walltime=00:01:00

 aprun -n 32 hostname

Such a script saved as ``filename.pbs`` file can be submitted to queue using:

.. code-block:: bash

 qsub filename.pbs

Interactive job
===============

Passing the ``-I`` flag to ``qsub`` allows a compute node to be used interactively.

For example, to request an interactive job on one of the Pascal nodes utilizing 1 GPU and 16 of the 36 available Broadwell CPU cores, use the following command:

.. code-block:: bash

    qsub -I -q pascalq -l select=1:ncpus=16:ngpus=1

For XCI (Phase 2), compilations can be run on the login nodes ``xcil00`` & ``xcil01``. Small development jobs can be run in the interactive queue ``arm-dev``.

Specifying resources
====================

To avoid blocking resources which aren't being used by your job, it is important to specify the correct amount of resources in your job script.

For example, this command declares that your job will run on a single node and will use one of the two available GPUs. The omission of the `ncpus` attribute causes it to default to `1`, meaning other jobs can enter the system to use any of the remaining 35 Broadwell CPU cores and the unused GPU.

.. code-block:: bash

  qsub -I -q pascalq -l select=1:ngpus=1

If you request `ngpus=2`, then any subsequently submitted job requesting a GPU will not run on the same node until a node is freed. Similarly setting `ncpus=36` will block any jobs from running.

Usage History
=============

You can see limited amount of job history by using the ``-x`` flag on ``qstat``, for example

..  code-block:: bash

  qstat -x -u $USER
  qstat -x -f <JOBID>

Isambard job statistics are not currently available in SAFE.
