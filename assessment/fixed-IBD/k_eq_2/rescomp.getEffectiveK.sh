#!/bin/bash
#$ -cwd
#$ -V
#$ -P mcvean.prjc -q short.qc
#$ -e ErrFiles
#$ -o OutFiles
#$ -N getK

srcPath="../../../src/"

pvv=( "10v90" "20v80"  "30v70" "40v60" "50v50" )

for vv in "${pvv[@]}"; do
    #${srcPath}getEffectiveK.r asiaGroup1 k_eq_2 2bites ${vv} ${srcPath}
    #${srcPath}getEffectiveK.r asiaGroup1 k_eq_2 1bites ${vv} ${srcPath}
    #${srcPath}getEffectiveK.r africaGroup2 k_eq_2 2bites ${vv} ${srcPath}
    #${srcPath}getEffectiveK.r africaGroup2 k_eq_2 1bites ${vv} ${srcPath}
    ${srcPath}getEffectiveK.r asiaGroup1 k_eq_2 1bites_high ${vv} ${srcPath}
    ${srcPath}getEffectiveK.r asiaGroup1 k_eq_2 1bites_low ${vv} ${srcPath}
    ${srcPath}getEffectiveK.r africaGroup2 k_eq_2 1bites_high ${vv} ${srcPath}
    ${srcPath}getEffectiveK.r africaGroup2 k_eq_2 1bites_low ${vv} ${srcPath}
done
