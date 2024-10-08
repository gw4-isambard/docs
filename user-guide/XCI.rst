XCI - Marvell Thunder X2
------------------------

Cray XC50 cabinet, codenamed XCI, containing 20’992 ARM cores. Available since November 2018, expanded September 2020.

* Marvell ThunderX2 ARM v8.1

  * 16nm FinFET CPU @ 2.1GHz (permanent turbo to 2.5GHz)
  * 4-way simultaneous multi-threading
  * 128-bit SIMD "NEON"
  * 32KB L1 instruction & data cache, 256KB L2 per core, 32MB distributed L3 cache
  * 8 DDR4 DIMMs @ 2666MHz
    * 160 nodes of 256GB, 169 nodes of 512GB
  * Cray Aries interconnect in dragonfly topology operating at 14Gbps~

* Cray Linux Environment 7 (Suse SLES 15)

  * Cray Programming Environment
  
Running
=======

Since the XCI system uses Cray ALPS to run jobs all compute intensive executables need to be run with ``aprun`` to run on the compute nodes otherwise the jobs can run on the MOM nodes that can cause problems. e.g

.. code-block::

  aprun -n 64 my_mpi.exe


For multithreaded OpenMP applications you could try:

.. code-block::

  export OMP_NUM_THREADS=64
  aprun -d 64 my_openmp.exe

For hybrid multithread with 64 MPI tasks and 4 OpenMP threads (using 4 hardware threads on XCI) you could use

.. code-block::

  export OMP_NUM_THREADS=4
  aprun -n 64 -d 4 -j 4


Queues
======

Work is submitted via the ``arm`` queue. 

There is also an ``arm-dev`` queue for running interactive development jobs up to three hours in duration. To specify an interactive job add the ``-I`` flag to your ``qsub`` command.

To target the larger memory nodes, add the following to your job script:

.. code-block::

  #PBS -l mem=500GB

Caveats
^^^^^^^

The default python version on login nodes is a system-bundled version, be sure to load a version of ``cray-python``. 

Known errors
^^^^^^^^^^^^

Some Cray compilers will emit this error message:

.. code-block::

  No supported cpu target is set, CRAY_CPU_TARGET=aarch64 will be used.
  Load a valid targeting module or set CRAY_CPU_TARGET

To silence this message and to ensure the correct CPU optimisations are applied, run the following before using the compiler:

``module load craype-arm-thunderx2``

To use the Cray compilers it is useful to load the latest cdt module.

``module load cdt``

Then compile your code and inside your job script load cdt before running e.g.

.. code-block::

  module load cdt
  aprun hello.exe

