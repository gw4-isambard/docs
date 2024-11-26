A64FX - Fujitsu
===============

All documentation for the A64fx Isambard hackathon on March 23/24 2021 can be found `here. <https://github.com/gw4-isambard/docs/tree/master/hackathons>`_

HPE Apollo 80 cabinet, codenamed A64FX. Available since February 2021.

* Fujitsu A64FX Processors @ 1.8GHz, 72 nodes
    * 48 ARMv8.2 cores with 512-bit SVE
    * 32 GB HBM2 memory arranged in 4 core memory groups (CMGs) with 12 cores and 8 GB each
    * 64 KB private L1 cache, 8 MB shared L2 cache per CMG
    * Mellanox Infiniband
* Red Hat Enterprise Linux 8
    * Cray Programming Environment
* Dedicated Lustre filesystem for job scratch directories: ``/scratch``
* Shared Lustre filesystem with XCI & MACS: ``/home``, ``/projects``, ``/software``

Running Jobs
------------

The system uses PBS Pro and the queue for the A64FX nodes is ``a64fx``.
It can only be used from the A64FX login nodes.

A job is requested as follows::

    qsub -q a64fx -lselect=N:ncpus=48,place=scatter ...

...where ``N`` is the number of nodes required.

Modules
-----------------

By default, the Cray programming environment is loaded.
A64FX-specific modules are exposed from ``/lustre/software/aarch64/modulefiles``.

The Bristol HPC group also maintains a shared modules space where you may find additional useful tools, but keep in mind that these may not always be up-to-date.
To use it: ``module use /lustre/projects/bristol/modules-a64fx/modulefiles``.

Note that this system *resets modules when starting a job*.
Make sure that your job scripts load all the modules needed to run your application.

Compilers
---------

All major HPC compilers targetting AArch64 are available through modules:

* Arm Compiler for Linux: 
    * ``tools/arm-compiler-a64fx/21.0``
    * ``tools/arm-compiler-a64fx/20.3``
* Cray Compilation Environment:
    * Classic frontend, targetting SVE: ``cce-sve/10.0.3``
    * Classic Clang frontend, no SVE support: ``cce/10.0.3``, new Clang with better C++ support in ``cce/14.0.1``
* Fujitsu Compiler, optimised for A64FX:
    * ``fujitsu-compiler/4.3.1``
* GNU Compiler Collection:
    * ``gcc/11-*``: snapshots of the development version (experimental, but with support for A64FX)
    * ``gcc/10.2.0``
    * ``gcc/8.1.0``

MPI
---

The default MPI library is CRAY MVAPICH, available though ``cray-mvapich2_noslurm_nogpu``.
It can be used with the GCC and Cray Compilers.

The Bristol modules space has builds of Open MPI with UCX:

* ``openmpi/4.1.0/gcc-11.0`` (also works with GCC 10.2)
* ``openmpi/4.1.0/arm-21.0``
* ``openmpi/4.1.0/arm-20.3``

There are older builds of Open MPI without UCX, but *these can only be used for single-node jobs*:

* ``openmpi/4.0.4/gcc-11.0`` (also works with GCC 10.2)
* ``openmpi/4.0.4/arm-20.3``

HDF5
----

Current versions of Cray HDF5 Parallel (`cray-hdf5-parallel/1.12.0.2`) require the following modules and environment variables in order to work.

.. code-block:: text

    > module load cray-mvapich2_noslurm_nogpu
    > module load cray-hdf5-parallel
    > export PE_HDF5_PARALLEL_REQUIRED_PRODUCTS=PE_MVAPICH2
    > export PKG_CONFIG_PATH=/projects/bristol/hackathon/fix/cray-hdf5-parallel-mvapich:${PKG_CONFIG_PATH}

    > cc HDF5_File_create.c -o HDF5_File_create
    > ./HDF5_File_create
    Warning: Process to core binding is enabled and OMP_NUM_THREADS is greater than one (48).
    If your program has OpenMP sections, this can cause over-subscription of cores and consequently poor performance
    To avoid this, please re-run your application after setting MV2_ENABLE_AFFINITY=0
    Use MV2_USE_THREAD_WARNING=0 to suppress this message

Fixes are planned for later versions of Cray PE.

Julia
----

Julia (tested for v1.6.0) and most of its functionalities work on A64FX with the binaries provided on [julialang.org](https://julialang.org/downloads/).
However, half precision/Float16/fp16 arithmetic on A64FX are not enabled in v1.6.0 and v1.6.1, see [#40216](https://github.com/JuliaLang/julia/issues/40216).
A fix is presented in that issue which requires building Julia from source, which has been successfully tested on Isambard.
The SVE on A64FX can currently not made use of in Julia through issues with LLVM12, see [#40308](https://github.com/JuliaLang/julia/issues/40308)

Documentation
-------------

`Fujitsu's website <https://www.fujitsu.com/global/products/computing/servers/supercomputer/a64fx>`_ includes an A64FX Datasheet and Microarchitecture Manual.
The architecture manual can also be found `on GitHub <https://github.com/fujitsu/A64FX>`_.
