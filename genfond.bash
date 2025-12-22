#!/bin/bash
#
#SBATCH --partition=rleap_gpu_24gb
#SBATCH --cpus-per-task=32
#SBATCH --mem=248000
#SBATCH --time=2-00
#SBATCH --output=%x-%j.out

export DLPLAN_SILENT_LOG=1
echo "Running: $@"
apptainer run --bind $PWD genfond_env.sif "$@"