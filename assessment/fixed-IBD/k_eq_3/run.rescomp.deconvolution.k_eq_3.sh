#!/bin/bash
source ../../../src/run.rescomp.deconvolution.src

#pvv=( "10v10v80" "10v15v75" "10v20v70" "10v25v65" "10v30v60" "10v40v50" \
 #"15v15v70" "15v20v65" "15v25v60" "15v30v55" "20v20v60" "20v25v55" \
 #"20v30v50" "25v25v50" "33v33v34" )

pvv=( "10v10v80" "10v25v65"  "10v40v50" \
 "15v25v60" "15v30v55"  \
 "20v30v50" "33v33v34" )

#pvv=( "10v15v75" "10v20v70" "10v30v60" "15v15v70" "15v20v65" "20v20v60" "20v25v55" "25v25v50" )


for vv in "${pvv[@]}"; do
#echo $vv;
    run_dEploid asiaGroup1 k_eq_3 3bites ${vv}
    run_dEploid asiaGroup1 k_eq_3 2bites ${vv}
    run_dEploid asiaGroup1 k_eq_3 1bites ${vv}
    run_dEploid africaGroup2 k_eq_3 3bites ${vv}
    run_dEploid africaGroup2 k_eq_3 2bites ${vv}
    run_dEploid africaGroup2 k_eq_3 1bites ${vv}
done
