#!/bin/bash
#SBATCH --job-name=acid_pixelsplat  # name of job
##SBATCH -C v100-32g                                                       # reserving 16 GB GPUs only if commented
##SBATCH --partition=gpu_p2                        # uncomment for gpu_p2 partition gpu_p2
##SBATCH --ntasks=4                                                                # total number of processes (= number of GPUs here)
#SBATCH --ntasks-per-node=4
#SBATCH --nodes=1                                  # nb reserved nodes
#SBATCH --gres=gpu:4                                       # number of GPUs
#SBATCH --cpus-per-task=10                                 # number of cores per task (1/4 of the 4-GPUs node)
# /!\ Caution, "multithread" in Slurm vocabulary refers to hyperthreading.
#SBATCH --hint=nomultithread                               # hyperthreading is deactivated
#SBATCH --time=85:00:00                                    # maximum execution time requested (HH:MM:SS)
##SBATCH --time=00:10:00                                   # maximum execution time requested (HH:MM:SS)
#SBATCH --output=slurm_logs/acid_pixelsplat_%j.output   # name of output file
#SBATCH --error=slurm_logs/acid_pixelsplat_%j.error     # name of error file (here, in common with the output file)
#SBATCH --qos=qos_gpu-t4                          # for running (max 100h)
##SBATCH --qos=qos_gpu-t3                          # for running (max 20h)
##SBATCH --qos=qos_gpu-dev                          # for veryfuing that the code is running.

EXP_NAME="acid_pixelsplat"
RUN_DIR="./outputs/${EXP_NAME}"

# Cleans out the modules loaded in interactive and inherited by default
module purge

# Loading of modules
module load python/3.11.5
module load cuda/12.1.0
conda activate psplat

# Echo of launched commands
set -x

# Code execution
srun python3 -m src.main +experiment=acid wandb.mode=offline exp_name=${EXP_NAME} hydra.run.dir=${RUN_DIR} trainer.devices=4 trainer.num_nodes=1 data_loader.train.batch_size=1 checkpointing.every_n_train_steps=10000

      
