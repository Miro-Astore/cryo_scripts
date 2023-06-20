#!/bin/bash
#SBATCH -D ./
#SBATCH -o train-%j.out
#SBATCH -e train-%j.err
#SBATCH --partition=gpu
#SBATCH --mem=256gb
#SBATCH --nodes=1
#SBATCH --gpus-per-node=4
#SBATCH --constraint=a100
#SBATCH --time=3-00:00:00


source $HOME/../shanson/.bashrc
conda activate cryodrgn1

cryodrgn train_vae ../downsampled_stack.mrcs --ctf ctf.pkl --poses poses.pkl --zdim 8 -n 100 -o train  | tee train.log
