#!/bin/bash
#SBATCH --job-name=zapiola    # Job name
#SBATCH --ntasks=1                    # Run on a single CPU
#SBATCH --cpus-per-task=1
#SBATCH --mem=3G
#SBATCH --time=8:00:00               # Time limit hrs:min:sec
#SBATCH --output=feots_logs   # Standard output and error log
#SBATCH -A climatehilat
#SBATCH --qos=standard

module use /users/jschoonover/modulefiles
module load gcc/8.3.0 mvapich2/2.3 hdf5-parallel/1.8.16 netcdf-h5parallel/4.4.0 feots/dev


srun -n${SLURM_NTASKS} feots integrate --dbroot ${FEOTS_DBROOT}  \
                                       --out ${OUTDIR} \
                                       --no-vertical-mixing \
                                       --param-file ./params/lanl/runtime.params
