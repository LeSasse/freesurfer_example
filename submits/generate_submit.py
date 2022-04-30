#!/usr/bin/env python3

import os

logs_dir="logs"


submit_file = "recon_all_subj.submit"
subjects = ["sub-101"]
condor_settings = f"""
executable = /usr/bin/bash
transfer_executable = False
initial_dir=../code
universe = vanilla
getenv = True
request_cpus = 1
request_memory = 5GB
request_disk = 10GB

"""

with open(submit_file, "w") as f:
    f.write(condor_settings)

for subject in subjects:
    arguments = f"""

arguments = ./recon_subj.sh {subject}
log = ../logs/{subject}$(Cluster).$(Process).log
output = ../logs/{subject}_$(Cluster).$(Process).out
error = ../logs/{subject}_$(Cluster).$(Process).err
Queue

"""
    with open(submit_file, "a") as f:
        f.write(arguments)   
