#!/bin/bash
#$ -cwd
#$ -V
#$ -P mcvean.prjc -q short.qc
#$ -e ErrFiles
#$ -o OutFiles
#$ -N getSeeds

srcPath="../../../src/"

pvv=( "11v22v30v37" "20v20v20v40" "30v30v30v10" "25v25v25v25" )

for vv in "${pvv[@]}"; do
    ${srcPath}getSeed.r asiaGroup1 k_eq_4 4bites ${vv} ${srcPath}
    ${srcPath}getSeed.r asiaGroup1 k_eq_4 3bites ${vv} ${srcPath}
    ${srcPath}getSeed.r asiaGroup1 k_eq_4 2bites_case1 ${vv} ${srcPath}
    ${srcPath}getSeed.r asiaGroup1 k_eq_4 2bites_case2 ${vv} ${srcPath}
    ${srcPath}getSeed.r asiaGroup1 k_eq_4 1bites ${vv} ${srcPath}

    ${srcPath}getSeed.r africaGroup2 k_eq_4 4bites ${vv} ${srcPath}
    ${srcPath}getSeed.r africaGroup2 k_eq_4 3bites ${vv} ${srcPath}
    ${srcPath}getSeed.r africaGroup2 k_eq_4 2bites_case1 ${vv} ${srcPath}
    ${srcPath}getSeed.r africaGroup2 k_eq_4 2bites_case2 ${vv} ${srcPath}
    ${srcPath}getSeed.r africaGroup2 k_eq_4 1bites ${vv} ${srcPath}
done
