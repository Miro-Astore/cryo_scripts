source $HOME/.bashrc
conda activate pyem2

#/mnt/home/mastore/Software/pyem/csparc2star.py J431_003_particles.cs J431_passthrough_particles.cs    from_csparc.star
#
module load modules/2.1-20230222  openmpi/4.0.7
module load relion/mpi-4.0.0
#
cd /mnt/home/mastore/ceph/cryosparc_folder/CS-thyroglobulin-cryo-hetero-challenge
#
#
pwd
#
#relion_stack_create --i J431/from_csparc.star 
##mv ../output.mrcs ../full_stack.mrcs 
#
cd J603

conda deactivate
source $HOME/../shanson/.bashrc

conda activate cryodrgn1

cryodrgn parse_pose_star from_csparc.star -D 288 -o poses.pkl
cryodrgn parse_ctf_star from_csparc.star --Apix 1.073 -D 288 -o ctf.pkl --ps 0

mkdir -p cryodrgn_train_relion_files
mv  poses.pkl cryodrgn_train_relion_files/
mv  ctf.pkl cryodrgn_train_relion_files/
cp train_cdrgn.slurm cryodrgn_train_relion_files

source $HOME/.bashrc

cd cryodrgn_train_relion_files
nbatch train_cdrgn.slurm
