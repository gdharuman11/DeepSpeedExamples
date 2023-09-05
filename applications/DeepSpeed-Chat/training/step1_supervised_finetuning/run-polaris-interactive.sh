# Script for interactive job submission

export HUGGINGFACE_HUB_CACHE=/lus/eagle/projects/RL-fold/gdharuman/hf-cache

module load conda/2023-01-10-unstable
conda activate tpc

# Prepare the Deepspeed hostfile
cat $PBS_NODEFILE > hostfile ; sed -e 's/$/ slots=4/' -i hostfile ; cat hostfile

# Set up it's environment
echo "PATH=${PATH}" > .deepspeed_env
echo "LD_LIBRARY_PATH=${LD_LIBRARY_PATH}" >> .deepspeed_env
echo "http_proxy=${http_proxy}" >> .deepspeed_env
echo "https_proxy=${https_proxy}" >> .deepspeed_env
echo "CFLAGS=${CFLAGS}" >> .deepspeed_env
echo "CXX=g++" >> .deepspeed_env
echo "HUGGINGFACE_HUB_CACHE=${HUGGINGFACE_HUB_CACHE}" >> .deepspeed_env

#source training_scripts/opt/single_node/run_13b.sh
# source training_scripts/opt/single_node/run_6.7b.sh
# source training_scripts/opt/single_node/run_1.3b.sh
source training_scripts/llama2/run_llama2_7b.sh
