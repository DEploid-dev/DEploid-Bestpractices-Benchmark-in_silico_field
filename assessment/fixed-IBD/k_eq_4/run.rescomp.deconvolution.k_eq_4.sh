#!/bin/bash
source ../../../src/run.rescomp.deconvolution.src

pvv=( "11v22v30v37" "20v20v20v40" "30v30v30v10" "25v25v25v25" )

for vv in "${pvv[@]}"; do
#echo $vv;
    run_dEploid asiaGroup1 k_eq_4 4bites ${vv}
    run_dEploid asiaGroup1 k_eq_4 3bites ${vv}
    run_dEploid asiaGroup1 k_eq_4 2bites_case1 ${vv}
    run_dEploid asiaGroup1 k_eq_4 2bites_case2 ${vv}
    run_dEploid asiaGroup1 k_eq_4 1bites ${vv}

    run_dEploid africaGroup2 k_eq_4 4bites ${vv}
    run_dEploid africaGroup2 k_eq_4 3bites ${vv}
    run_dEploid africaGroup2 k_eq_4 2bites_case1 ${vv}
    run_dEploid africaGroup2 k_eq_4 2bites_case2 ${vv}
    run_dEploid africaGroup2 k_eq_4 1bites ${vv}
done
