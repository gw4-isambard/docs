********
Software
********

This page summarises the software available across the cluster, please keep in mind that available packages and versions may vary between the different architectures of GW4 Isambard.

..
    Set MODULEPATH to exclude sysadmin tools
        MODULEPATH="$( echo $MODULEPATH | sed 's|/opt/cray/ari/modulefiles:?||' )"
    
    Append arm64 modules
        MODULEPATH="${MODULEPATH}:/software/arm64/modulefiles"

    Append a64fx modules
        MODULEPATH="${MODULEPATH}:/software/arm64/a64fx/modulefiles"

    Append x86 modules
        MODULEPATH="${MODULEPATH}:/software/x86_64/modulefiles"

    Generate these CSV with the following, convoluted commands:
        module av --terse 2>&1 | grep -v : | sed 's/(default)//' | xargs -n1 -I{} bash -c "printf 'ISM_{},\"\n'; module show '{}' 2>&1 | egrep 'ISM_|^module-whatis'" | sed -re 's/^module-whatis(\t|\s)+//; s/\/[0-9]\..*?,/,/' | sed ':a;N;$!ba; s/\n/ /g; s/ISM_/\n/g;' | sort -u -t, -k1 | sed -re 's/$/"/; s/ ?" ?/"/'

Python VirtualEnv
#################

Python Virtual Environments provide a self-contained Python installation where you can install modules without altering your profile and other project's python environemnts.

Load an appropriate python module.

.. code-block::

    > python3 -m venv myvenv
    > cd myvenv
    > source bin/activate
    > python -m pip install -U pip

MACS
####

MACS Python
***********

Python3 is provided as part of the MACS system

.. code-block::

    > python3 --version
    Python 3.5.1
    > python2 --version
    Python 2.7.5

MACS Module list
****************

Last updated 2021-07-27

.. csv-table::
    :file: ./software-macs.csv
    :header-rows: 1

XCI
###

XCI Python
**********

Cray provides an optimzied Python3 build via the ``cray-python`` module.

.. code-block::

    > module load cray-python
    > python3 --version
    Python 3.7.3

Without this module loaded, ``python`` points to python2. Python2 can be invoked even with ``cray-python`` loaded by running ``python2`` explicitly.

XCI Module list
***************

Last updated 2021-07-27

.. csv-table:: 
    :file: ./software-xci.csv
    :header-rows: 1

A64FX
#####

A64FX Python
************

Builds exist in both ``/projects/bristol/modules-arm/modulefiles`` & ``/projects/bristol/modules-a64fx/modulefiles``

A64FX Module list
*****************

Last updated 2021-07-27 

.. code-block::

    > module use
    > module avail python
    > module load python/3.9.2
    > python3 --version
    Python 3.9.2

.. csv-table::
    :file: ./software-a64fx.csv
    :header-rows: 1