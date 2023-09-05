#!/bin/bash -le
#PBS -l select=1:system=polaris
#PBS -l walltime=4:00:00
#PBS -l filesystems=home:grand:eagle
#PBS -q preemptable
#PBS -N small-full-run
#PBS -A RL-fold

# Change to working directory
cd ${PBS_O_WORKDIR}

export HUGGINGFACE_HUB_CACHE=/lus/eagle/projects/RL-fold/gdharuman/hf-cache

module load conda/2023-01-10-unstable
conda activate tpc

python train.py --actor-model facebook/opt-1.3b --reward-model facebook/opt-350m --deployment-type single_gpu
