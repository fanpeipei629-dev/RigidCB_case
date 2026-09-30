#!/bin/bash
#SBATCH -J backmesh
#SBATCH -p wzhcnormal
#SBATCH --nodes=8
#SBATCH --ntasks-per-node=16
#SBATCH -o %j.o
#SBATCH -e %j.e


echo ${SLURM_JOB_NODELIST} 

echo start on $(date)

blockMesh
surfaceFeatures
decomposePar
mpirun topoSet -parallel
mpirun refineMesh -overwrite -parallel
mpirun snappyHexMesh -overwrite -parallel
reconstructParMesh -constant -mergeTol 1e-6
checkMesh
touch backmesh.foam

echo end on $(date)

