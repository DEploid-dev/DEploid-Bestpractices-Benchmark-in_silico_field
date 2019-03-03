#!/bin/bash
source ../../../src/run.rescomp.deconvolution.src

pvv=( "10v90" "20v80"  "30v70" "40v60" "50v50" )

for vv in "${pvv[@]}"; do
#echo $vv;
    run_dEploid asiaGroup1 k_eq_2 2bites ${vv}
    #run_dEploid asiaGroup1 k_eq_2 1bites ${vv}
    #run_dEploid africaGroup2 k_eq_2 2bites ${vv}
    #run_dEploid africaGroup2 k_eq_2 1bites ${vv}
    #run_dEploid asiaGroup1 k_eq_2 1bites_high ${vv}
    #run_dEploid asiaGroup1 k_eq_2 1bites_low ${vv}
    #run_dEploid africaGroup2 k_eq_2 1bites_high ${vv}
    #run_dEploid africaGroup2 k_eq_2 1bites_low ${vv}
done
