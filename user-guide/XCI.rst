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

Since the XCI system uses Cray ALPS to run jobs all executables run in jobs need to be run with ``aprun`` otherwise the jobs can run on the MOM nodes that can cause problems.

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
