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

Documentation
.............

Fujitsu's website includes an A64FX Datasheet and Microarchitecture Manual: https://www.fujitsu.com/global/products/computing/servers/supercomputer/a64fx/