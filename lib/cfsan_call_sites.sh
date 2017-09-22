#!/bin/bash
#Author:A.Hernandez
#help
#Usage: cfsan_call_sites.sh 

export VarscanMpileup2snp_ExtraParams="--min-var-freq 0.90"
export VarscanJvm_ExtraParams="-Xmx15g"


# Test whether the script is being executed with sge or not.
if [ -z $sge_task_id ]; then
        use_sge=0
else
        use_sge=1
fi


# Exit immediately if a pipeline, which may consist of a single simple command, a list, or a compound command returns a non-zero status
set -e
# Treat unset variables and parameters other than the special parameters ‘@’ or ‘*’ as an error when performing parameter expansion. An error message will be written to the standard error, and a non-interactive shell will exit
set -u
#Print commands and their arguments as they are executed.
set -x

#VARIABLES

threads=$1
dir=$2
samples=$3
unsorted_bam_list=$4
cfsan_ref_path=$5

if [ "$use_sge" = "1" ]; then                                                                                                                                                                                               
   	sample_count=$sge_task_id                                                                      
else                                                                                                        
   	sample_count=$6                                                                                   
fi

sample=$( echo $samples | tr ":" "\n" | head -$sample_count | tail -1)
unsorted_bam_file=$( echo $unsorted_bam_list | tr ":" "\n" | head -$sample_count | tail -1)

cfsan_snp_pipeline call_sites $cfsan_ref_path $dir/$sample