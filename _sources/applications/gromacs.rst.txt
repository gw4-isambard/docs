GROMACS
=======

Useful links
------------

- `GROMACS user documentation <http://manual.gromacs.org/documentation/current/user-guide/index.html>`_

Licensing
---------

GROMACS is open source (see the `GROMACS License Agreement <https://github.com/gromacs/gromacs/blob/master/COPYING>`_).

Version
-------

The following versions of GROMACS are currently available:

* ``module load apps/gromacs/2018.4`` (MPI enabled, no double precision)

Running
-------

Example Job Submission Script
.............................

Arm
...

.. code-block:: bash

    #!/bin/bash

    # Select 128 nodes (maximum of 8192 cores)
    #PBS -l select=128

    # Set maximum job walltime
    #PBS -l walltime=00:30:00

    # Change to the directory the script was submitted from
    cd $PBS_O_WORKDIR

    # Load the desired version of GROMACS
    module load apps/gromacs/2018.4

    # Launch 8192 MPI ranks (64 per node, 1 per core)
    # Launch 4 OpenMP threads per rank (using 4-way hyperthreading)
    export OMP_NUM_THREADS=4
    aprun -n 8192 -d 4 -j 4 \
      gmx_mpi mdrun -s input.tpr -ntomp 4


Notes
.....

For maximum performance, you may wish to tune the MPI/OpenMP decomposition.
At large scale, you may find that reducing the number of MPI ranks and increasing the number of OpenMP threads yields better performance.

GROMACS can also use tabulated Ewald non-bonded kernels instead of an analytical approach, which can improve performance for smaller node counts (use ``export GMX_NBNXN_EWALD_TABLE=1`` to enable this feature).
