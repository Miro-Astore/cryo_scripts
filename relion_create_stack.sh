module load modules/2.1-20230222  openmpi/4.0.7
module load relion/mpi-4.0.0
#relion_stack_create --i J310/from_csparc.star --apply_rounded_offsets_only
cd ..
relion_stack_create --i J603/from_csparc.star --o J603/cryo_heterogeneity_challenge_second_dataset.mrcs
cd -
