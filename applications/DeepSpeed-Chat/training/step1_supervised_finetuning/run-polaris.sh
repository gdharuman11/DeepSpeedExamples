#!/bin/bash -le
#PBS -l select=1:system=polaris
#PBS -l walltime=4:00:00
#PBS -l filesystems=home:grand:eagle
#PBS -q preemptable
#PBS -N small-run
#PBS -A RL-fold

# Change to working directory
cd ${PBS_O_WORKDIR}

export HUGGINGFACE_HUB_CACHE=/lus/eagle/projects/RL-fold/gdharuman/hf-cache

module load conda/2023-01-10-unstable
conda activate tpc

#source training_scripts/opt/single_node/run_13b.sh
# source training_scripts/opt/single_node/run_6.7b.sh
# source training_scripts/opt/single_node/run_1.3b.sh
source training_scripts/llama2/run_llama2_7b.sh
