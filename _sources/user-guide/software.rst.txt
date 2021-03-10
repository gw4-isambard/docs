Software
--------

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

MACS
####

.. csv-table::
    :file: ./software-macs.csv
    :header-rows: 1

XCI
###

.. csv-table:: 
    :file: ./software-xci.csv
    :header-rows: 1

A64FX
#####

.. csv-table::
    :file: ./software-a64fx.csv
    :header-rows: 1