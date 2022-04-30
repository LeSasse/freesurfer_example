#!/usr/bin/bash
#############################################################################
#############################################################################


subj=${1}


#############################################################################
#############################################################################
# Set up environment


code=$(pwd)
echo "Loading Freesurfer!"
module load freesurfer/7.1
echo "FREESURFER_HOME=${FREESURFER_HOME}"

REPO=https://github.com/OpenNeuroDatasets/ds000174.git
export INPUT_DIR=$(mktemp -d)
export SUBJECTS_DIR=${code}/../freesurfer/subjects

echo "INPUT_DIR=${INPUT_DIR}"
echo "SUBJECTS_DIR=${SUBJECTS_DIR}"

file_bl=${INPUT_DIR}/${subj}/ses-BL/anat/${subj}_ses-BL_T1w.nii.gz


#############################################################################
#############################################################################
# get data


datalad clone ${REPO} ${INPUT_DIR}
cd ${INPUT_DIR}
datalad get ${file_bl}


#############################################################################
#############################################################################
# Recon all


recon-all -all -i ${file_bl} -s ${subj}




