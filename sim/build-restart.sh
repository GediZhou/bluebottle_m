#!/bin/sh
# **MAKE SURE THIS FILE IS EXECUTABLE**

echo "#!/bin/sh" > restart.sh
echo "#" >> restart.sh
echo "#SBATCH --partition=gpuscav" >> restart.sh
echo "#SBATCH --qos=scavenger" >> restart.sh
echo "#SBATCH --time=12:0:0" >> restart.sh
echo "#SBATCH --nodes=1" >> restart.sh
echo "#SBATCH --ntasks-per-node=1" >> restart.sh
echo "#SBATCH --cpus-per-task=6" >> restart.sh
echo "#SBATCH --gres=gpu:1" >> restart.sh
echo "#SBATCH --job-name=$1" >> restart.sh
echo "#SBATCH --dependency=afterok:$2" >> restart.sh
echo "#SBATCH --output=bluebottle.out" >> restart.sh
echo "#SBATCH --open-mode=append" >> restart.sh
echo "sleep 5" >> restart.sh
echo "./build-restart.sh \$SLURM_JOB_NAME \$SLURM_JOB_ID" >> restart.sh
echo "sleep 5" >> restart.sh
echo "sbatch restart.sh" >> restart.sh
echo "sleep 5" >> restart.sh
echo "srun ./bluebottle -r" >> restart.sh
