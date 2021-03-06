#!/usr/bin/env Rscript
rm(list=ls());
args = (commandArgs(TRUE))

relative_src_path = args[5]
errorAnalysis_path = paste(relative_src_path, "DEploid-Utilities/errorAnalysis.r", sep ="")

print(args)
source(errorAnalysis_path)

classicRoot_path = "/well/mcvean/joezhu/DEploid-Data-Benchmark-in_silico_field/fixed_IBD/"
dataRoot_path = "/well/mcvean/joezhu/DEploid-Bestpractices-Benchmark-in_silico_field/assessment/fixed-IBD/"

popgroup = args[1]
k_case = args[2]
scenario = args[3]
vv = args[4]

k_case_path = paste(dataRoot_path, k_case, "/dEploidOut/", sep = "")
classic_k_case_path = paste(classicRoot_path, k_case, "/dEploidOut/", sep = "")

scenario_path_part = paste(popgroup, ".", k_case, ".", scenario, sep = "")
scenario_path = paste(k_case_path, scenario_path_part, "/", sep = "")
classic_scenario_path = paste(classic_k_case_path, scenario_path_part, "/", sep = "")

prefix = paste(scenario_path_part, ".", vv, sep = "")
ret = data.frame(ID = character(),
            popgroup = character(),
            k_case = character(),
            scenario = character(),
            vv = character(),
            index = c(),
            number_of_DEploidBEST_replicates = c(),
            seed_of_DEploidBEST = c(),
            number_of_DEploid_replicates = c(),
            seed_of_DEploid = c())
for ( experiment_idx in 1:100 ){
    experiment_path_part = paste(scenario_path_part, ".experiment", experiment_idx, "/", sep = "")
    experiment_id = paste(prefix, ".experiment", experiment_idx, sep = "")

    best_seeds = c()
    best_k = c()
    for (seed in 1:15) {
        logFileName = paste(scenario_path, experiment_path_part, experiment_id, ".seed", seed, ".best.log", sep = "")
#        print(logFileName)
        if (!file.exists(logFileName)){
            next
        }
        best_seeds = c(best_seeds, seed)
        best_k = c(best_k, getProportionFromLastLine(logFileName) %>% computeInferred.k)
    }
    best_seed_and_k = data.frame(seed = best_seeds, inferred.k = best_k)

    classic_seeds = c()
    classic_k = c()
    for (seed in 1:15) {
        logFileName = paste(classic_scenario_path, experiment_path_part, experiment_id, ".seed", seed, ".log", sep = "")
        print(logFileName)
        if (!file.exists(logFileName)){
            next
        }
        classic_seeds = c(classic_seeds, seed)
        classic_k = c(classic_k, getProportionFromLastLine(logFileName) %>% computeInferred.k)
    }
    classic_seed_and_k = data.frame(seed = classic_seeds, inferred.k = classic_k)
print(experiment_id)
print(best_seeds)
print(best_seed_and_k)
print(classic_seeds)
print(classic_seed_and_k)
    if (length(best_seeds) > 0 & length(classic_seeds) >0){
    tmp = data.frame(ID = experiment_id,
                popgroup = popgroup,
                k_case = k_case,
                scenario = scenario,
                vv = vv,
                index = experiment_idx,
                number_of_DEploidBEST_replicates = length(best_seeds),
                seed_of_DEploidBEST = chooseSeed(best_seed_and_k),
                number_of_DEploid_replicates = length(classic_seeds),
                seed_of_DEploid = chooseSeed(classic_seed_and_k))
    ret = rbind(ret, tmp)
    }
}

write.table(ret, file = paste(prefix, ".seed", sep = ""), quote = F, sep = "\t", row.names = F)
