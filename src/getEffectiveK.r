#!/usr/bin/env Rscript
rm(list=ls());
args = (commandArgs(TRUE))

relative_src_path = args[5]
errorAnalysis_path = paste(relative_src_path, "DEploid-Utilities/errorAnalysis.r", sep ="")

print(args)
source(errorAnalysis_path)

dataRoot_path = "/well/mcvean/joezhu/DEploid-Bestpractices-Benchmark-in_silico_field/fixed_IBD/"

popgroup = args[1]
k_case = args[2]
scenario = args[3]
vv = args[4]

k_case_path = paste(dataRoot_path, k_case, "/dEploidOut/", sep = "")

scenario_path_part = paste(popgroup, ".", k_case, ".", scenario, sep = "")
scenario_path = paste(k_case_path, scenario_path_part, "/", sep = "")

prefix = paste(scenario_path_part, ".", vv, sep = "")

#experiment_ID, effective_K_of_DEploidIBD, effective_K_of_DEploid, inferred_K_of_DEploidIBD, inferred_K_of_DEploid

seeds = read.table(paste(prefix, ".seed", sep = ""), header=T)
ret = data.frame(ID = character(), effective_K_of_DEploidIBD = c(), effective_K_of_DEploid = c(), inferred_K_of_DEploidIBD = c(), inferred_K_of_DEploid = c())
for ( experiment_idx in 1:100 ){
    experiment_path_part = paste(scenario_path_part, ".experiment", experiment_idx, "/", sep = "")
    experiment_id = paste(prefix, ".experiment", experiment_idx, sep = "")

    row.idx = which(seeds$ID == experiment_id)
    ibdlogFileName = paste(scenario_path, experiment_path_part, experiment_id, ".seed", seeds$seed_of_DEploidIBD[row.idx], ".ibd.log", sep = "")
    logFileName = paste(scenario_path, experiment_path_part, experiment_id, ".seed", seeds$seed_of_DEploid[row.idx], ".log", sep = "")

    tmp = data.frame(ID = experiment_id,
                     effective_K_of_DEploidIBD = getProportionFromLastLine(ibdlogFileName) %>% computeEffectiveK,
                     effective_K_of_DEploid = getProportionFromLastLine(logFileName) %>% computeEffectiveK,
                     inferred_K_of_DEploidIBD = getProportionFromLastLine(ibdlogFileName) %>% computeInferred.k,
                     inferred_K_of_DEploid = getProportionFromLastLine(logFileName) %>% computeInferred.k)
    ret = rbind(ret, tmp)
}

write.table(ret, file = paste(prefix, ".effectiveK", sep = ""), quote = F, sep = "\t", row.names = F)
