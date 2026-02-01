#!/bin/sh
#SBATCH --time=00:10:00
#SBATCH --partition=normal-x86
#SBATCH -A f202500010hpcvlabuminhox
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=128
#SBATCH --cpus-per-task=1
#SBATCH --exclusive

ml OpenFOAM/v2412-foss-2023a
source $FOAM_INST_DIR/OpenFOAM-v2412/etc/bashrc

echo "Running on nodes:"
scontrol show hostname $SLURM_NODELIST

./Allclean
./Allrun
