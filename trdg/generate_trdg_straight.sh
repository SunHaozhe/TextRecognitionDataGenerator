#!/bin/bash
#SBATCH --partition=all
#SBATCH --qos=default
#SBATCH --output=logs/%j.stdout
#SBATCH --error=logs/%j.stderr
#SBATCH --job-name=trdg
#SBATCH --open-mode=append
#SBATCH --signal=B:USR1@120
#SBATCH --requeue
#SBATCH --cpus-per-task=4


SECONDS=0


restart(){
    echo "Calling restart" 
    scontrol requeue $SLURM_JOB_ID
    echo "Scheduled job for restart" 
}

ignore(){
    echo "Ignored SIGTERM" 
}
trap restart USR1
trap ignore TERM


# Start experiments

date 
which python 

echo "=== Beginning program ===" 
echo "Slurm job ID: $SLURM_JOB_ID" 

echo "CUDA_VISIBLE_DEVICES is $CUDA_VISIBLE_DEVICES" 


for digit in "0" "1" "2" "3" "4" "5" "6" "7" "8" "9"
do
    srun python run.py --extension png --image_mode L --background 1 --thread_count 4 -c 6000 --output_dir trdg_datasets/trdg_straight/${digit} --dict dicts/ascii_digits_${digit}.txt
done


DURATION=$SECONDS

echo "End of the program! $(($DURATION / 60)) minutes and $(($DURATION % 60)) seconds elapsed." 












