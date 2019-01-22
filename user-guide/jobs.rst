Running jobs
------------

Isambard uses the PBS Pro scheduler to manage compute resources. Phase 1 uses `PBS Pro 13.1 <http://www.pbsworks.com/pdfs/PBSProUserGuide13.1.pdf>`_ & Phase 2 uses `PBS Pro 18.2 <https://www.pbsworks.com/pdfs/PBSUserGuide18.2.pdf>`_.

Phase 1 and Phase 2 use separate schedulers, jobs must be submitted from the login nodes for the relevant system.

Limits
======

Users can submit any number of jobs but only two jobs per-user per-queue will run at the same time.

Queue configuration
===================

* arm     - Run on 164x Thunder X2 XC50 compute nodes
* arm-dev - Run interatively on up to 4x Thunder X2 XC50 compute nodes
* knl     - Run on 8x Intel Xeon Phi "Knights Landing" 7210 CPU nodes
* pascal  - Run on 4x dual-card Nvidia Tesla P100 "Pascal" GPU nodes
* power   - Run on 2x IBM Power 9 nodes, each with dual-card Nvidia V100 "Volta" GPUs ← ``Queue unavailable, interactive use only, hosts: power-001, power-002``

knlq is split into two sets of MCDRAM configuration, nodes 001-004 are in cache memory mode (quad_0) and nodes 005-008 are in flat memory mode (quad_100). These modes can be targeted using the ``aoe=`` PBS attribute.

To see the available queues and their current state:

.. code-block:: bash

  qstat -q

Batch job
=========

Phase 1 example:

.. code-block:: bash

 #!/bin/bash
 #PBS -q pascal
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


Interactive job
===============

Passing the ``-I`` flag to ``qsub`` allows a compute node to be used interactively.

For example, to request an interactive job on one of the Pascal nodes utilizing 1 GPU and 16 of the 36 available Broadwell CPU cores, use the following command:

.. code-block:: bash

    qsub -I -q pascalq -l select=1:ncpus=16:ngpus=1

Interative jobs are not enabled on Phase 2, compilations can be run on the login nodes ``xcil00`` & ``xcil01``.

Specifying resources
====================

To avoid blocking resources which aren't being used by your job, it is important to specify the correct amount of resources in your job script.

For example, this command declares that your job will run on a single node and will use one of the two available GPUs. The omission of the `ncpus` attribute causes it to default to `1`, meaning other jobs can enter the system to use any of the remaining 35 Broadwell CPU cores and the unused GPU.

.. code-block:: bash

  qsub -I -q pascal -l select=1:ngpus=1

If you request `ngpus=2`, then any subsequently submitted job requesting a GPU will not run on the same node until a node is freed. Similarly setting `ncpus=36` will block any jobs from running.

