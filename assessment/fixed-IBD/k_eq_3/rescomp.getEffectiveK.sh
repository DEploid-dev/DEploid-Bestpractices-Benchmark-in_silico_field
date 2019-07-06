#!/bin/bash
#$ -cwd
#$ -V
#$ -P mcvean.prjc -q short.qc
#$ -e ErrFiles
#$ -o OutFiles
#$ -N getEffectiveKs

srcPath="../../../src/"

pvv=( "10v10v80" "10v25v65"  "10v40v50" \
 "15v25v60" "15v30v55"  \
 "20v30v50" "33v33v34" )

for vv in "${pvv[@]}"; do
    ${srcPath}getEffectiveK.r asiaGroup1 k_eq_3 3bites ${vv} ${srcPath}
    ${srcPath}getEffectiveK.r asiaGroup1 k_eq_3 2bites ${vv} ${srcPath}
    ${srcPath}getEffectiveK.r asiaGroup1 k_eq_3 1bites ${vv} ${srcPath}
    ${srcPath}getEffectiveK.r africaGroup2 k_eq_3 3bites ${vv} ${srcPath}
    ${srcPath}getEffectiveK.r africaGroup2 k_eq_3 2bites ${vv} ${srcPath}
    ${srcPath}getEffectiveK.r africaGroup2 k_eq_3 1bites ${vv} ${srcPath}
done
