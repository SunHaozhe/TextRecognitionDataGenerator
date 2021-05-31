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



srun python run.py --image_mode L --background 1 --thread_count 4 -c 6000 --output_dir trdg_datasets/trdg_straight/0 --dict dicts/ascii_digits_0.txt
srun python run.py --image_mode L --background 1 --thread_count 4 -c 6000 --output_dir trdg_datasets/trdg_straight/1 --dict dicts/ascii_digits_1.txt
srun python run.py --image_mode L --background 1 --thread_count 4 -c 6000 --output_dir trdg_datasets/trdg_straight/2 --dict dicts/ascii_digits_2.txt
srun python run.py --image_mode L --background 1 --thread_count 4 -c 6000 --output_dir trdg_datasets/trdg_straight/3 --dict dicts/ascii_digits_3.txt
srun python run.py --image_mode L --background 1 --thread_count 4 -c 6000 --output_dir trdg_datasets/trdg_straight/4 --dict dicts/ascii_digits_4.txt
srun python run.py --image_mode L --background 1 --thread_count 4 -c 6000 --output_dir trdg_datasets/trdg_straight/5 --dict dicts/ascii_digits_5.txt
srun python run.py --image_mode L --background 1 --thread_count 4 -c 6000 --output_dir trdg_datasets/trdg_straight/6 --dict dicts/ascii_digits_6.txt
srun python run.py --image_mode L --background 1 --thread_count 4 -c 6000 --output_dir trdg_datasets/trdg_straight/7 --dict dicts/ascii_digits_7.txt
srun python run.py --image_mode L --background 1 --thread_count 4 -c 6000 --output_dir trdg_datasets/trdg_straight/8 --dict dicts/ascii_digits_8.txt
srun python run.py --image_mode L --background 1 --thread_count 4 -c 6000 --output_dir trdg_datasets/trdg_straight/9 --dict dicts/ascii_digits_9.txt

DURATION=$SECONDS

echo "End of the program! $(($DURATION / 60)) minutes and $(($DURATION % 60)) seconds elapsed." 












