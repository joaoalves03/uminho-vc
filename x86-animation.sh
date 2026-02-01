#!/bin/sh
#SBATCH --time=00:05:00
#SBATCH --partition=normal-x86
#SBATCH -A f202500010hpcvlabuminhox
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=128
#SBATCH --cpus-per-task=1
#SBATCH --exclusive

echo "Running on nodes:"
scontrol show hostname $SLURM_NODELIST

ml ParaView/6.0.1-foss-2025a
ml FFmpeg/7.1.1-GCCcore-14.2.0

mpirun -np $SLURM_NTASKS_PER_NODE pvbatch --force-offscreen-rendering animate2.py
