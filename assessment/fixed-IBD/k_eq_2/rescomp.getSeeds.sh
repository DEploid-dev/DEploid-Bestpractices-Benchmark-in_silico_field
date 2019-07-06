#!/bin/bash
#$ -cwd
#$ -V
#$ -P mcvean.prjc -q short.qc
#$ -e ErrFiles
#$ -o OutFiles
#$ -N getSeeds

srcPath="../../../src/"

pvv=( "10v90" "20v80"  "30v70" "40v60" "50v50" )

for vv in "${pvv[@]}"; do
    ${srcPath}getSeed.r asiaGroup1 k_eq_2 2bites ${vv} ${srcPath}
    ${srcPath}getSeed.r asiaGroup1 k_eq_2 1bites ${vv} ${srcPath}
    ${srcPath}getSeed.r africaGroup2 k_eq_2 2bites ${vv} ${srcPath}
    ${srcPath}getSeed.r africaGroup2 k_eq_2 1bites ${vv} ${srcPath}
    ${srcPath}getSeed.r asiaGroup1 k_eq_2 1bites_high ${vv} ${srcPath}
    ${srcPath}getSeed.r asiaGroup1 k_eq_2 1bites_low ${vv} ${srcPath}
    ${srcPath}getSeed.r africaGroup2 k_eq_2 1bites_high ${vv} ${srcPath}
    ${srcPath}getSeed.r africaGroup2 k_eq_2 1bites_low ${vv} ${srcPath}
done
