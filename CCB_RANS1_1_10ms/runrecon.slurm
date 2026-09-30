#!/bin/bash
#SBATCH -J backmesh
#SBATCH -p wzhcnormal
#SBATCH --nodes=8
#SBATCH --ntasks-per-node=16
#SBATCH -o %j.o
#SBATCH -e %j.e



decomposePar
mpirun simpleFoam -parallel

mpirun simpleFoam -postProcess -func wallShearStress -parallel
mpirun simpleFoam -postProcess -func Q -parallel
mpirun simpleFoam -postProcess -func yPlus -parallel

reconstructPar


rm processor* -rf

touch HDPE_10ms.foam
