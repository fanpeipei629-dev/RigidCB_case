#!/bin/bash
#SBATCH -J backmesh
#SBATCH -p wzhcnormal
#SBATCH --nodes=8
#SBATCH --ntasks-per-node=16
#SBATCH -o %j.o
#SBATCH -e %j.e


mpirun simpleFoam -postProcess -func wallShearStress -parallel
mpirun simpleFoam -postProcess -func Q -parallel
mpirun simpleFoam -postProcess -func yPlus -parallel

reconstructPar


touch CCB_10ms.foam
