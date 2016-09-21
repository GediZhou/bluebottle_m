#!/bin/sh
#
#SBATCH --partition=gpu
#SBATCH --time=12:0:0
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=6
#SBATCH --job-name=forceT
#SBATCH --gres=gpu:1
#SBATCH --output=bluebottle.out
#SBATCH --open-mode=append

sleep 5

./build-restart.sh $SLURM_JOB_NAME $SLURM_JOB_ID

sleep 5

sbatch restart.sh

sleep 5

srun ./bluebottle 
