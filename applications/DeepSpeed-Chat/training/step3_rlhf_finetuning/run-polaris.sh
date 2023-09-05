# Script for interactive job submission on Polaris

export HUGGINGFACE_HUB_CACHE=/lus/eagle/projects/RL-fold/gdharuman/hf-cache

module load conda/2023-01-10-unstable
conda activate tpc

source training_scripts/opt/single_node/run_1.3b.sh