A64FX - Fujitsu
---------------

HPE Apollo 80 cabinet, codenamed A64FX. Available since February 2021.

* Fujitsu A64FX
    * 48x Arm v8.2 SVE cores
    * 32GB HBM2 memory arranged in 4x 12-core memory groups with 8GB each
    * 64KB L1 cache, 8MB L2 cache per core memory group
    * Mellanox Infiniband
* Red Hat Enterprise Linux 8
    * Cray Programming Environment

Dedicated Lustre filesystem for job scratch directories

Shared Lustre filesystem with XCI & MACS for /home, /projects & /software

Queues
......

The default queue is `a64fx`.

In order to request a full node(s) exclusively for your job, the job script must include `-l select=XX:ncpus=48`, where XX is the number of nodes requested. If your job uses MPI you must also set `mpiprocs=Y` where Y is the number of MPI threads you need per node.

The following example saturates two nodes with 48 MPI threads each.

.. code-block:: text
 #PBS -l select2:ncpus=48:mpiprocs=48

Documentation
.............

Fujitsu's website includes an A64FX Datasheet and Microarchitecture Manual: https://www.fujitsu.com/global/products/computing/servers/supercomputer/a64fx/