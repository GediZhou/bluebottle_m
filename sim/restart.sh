#!/bin/sh
#
#SBATCH --partition=gpuscav
#SBATCH --qos=scavenger
#SBATCH --time=12:0:0
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=6
#SBATCH --gres=gpu:1
#SBATCH --job-name=forceT
#SBATCH --dependency=afterok:8801495
#SBATCH --output=bluebottle.out
#SBATCH --open-mode=append
sleep 5
./build-restart.sh $SLURM_JOB_NAME $SLURM_JOB_ID
sleep 5
sbatch restart.sh
sleep 5
srun ./bluebottle -r
