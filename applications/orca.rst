ORCA
=======

Useful links
------------

- `ORCA user portal <https://orcaforum.kofo.mpg.de/app.php/portal>`_

Licensing
---------

ORCA is subject to an EULA (End User License Agreement) (see the `ORCA End User License Agreement <https://orcaforum.kofo.mpg.de/app.php/dlext/?view=detail&df_id=126>`_).

In order to be given access to ORCA you will need to confirm that you have read and agree to the EULA. Please contact the Isambard support team in order to do this and obtain access. 


Version
-------

The following versions of ORCA are currently available:

* ``module load apps/orca/5.0.2`` 

Running
-------

Example Job Submission Script
.............................

Arm
...

.. code-block:: bash

    #!/bin/bash

    # Select 1 nodes (64 cores)
    #PBS -l select=1:ncpus=64

    # Set maximum job walltime
    #PBS -l walltime=00:30:00

    # Change to the directory the script was submitted from
    cd $PBS_O_WORKDIR

    # Load the desired version of ORCA
    module load apps/orca/5.0.2

    $(which orca) my_orca_input.inp 1>> out.log 2>&1


