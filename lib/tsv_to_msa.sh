#!/bin/bash
## Author: A.Hernandez
## version v2.0

if [ $# -eq 0 ];then
        echo -e "\nScript to convert tsv file to msa\n"
        echo -e "Usage: tsv_to_msa.sh input_dir tsv_file msa_file"
        exit
fi

# Exit immediately if a pipeline, which may consist of a single simple command, a list, or a compound command returns a non-zero status
set -e
# Treat unset variables and parameters other than the special parameters ‘@’ or ‘*’ as an error when performing parameter expansion. An error message will be written to the standard error, and a non-interactive shell will exit
set -u
#Print commands and their arguments as they are executed.
set -x

#VARIABLES

dir=$1
tsv_file=$2
msa_file=$3

perl $SCRIPTS_DIR/matrixToAlignment.pl $dir/$tsv_file > $dir/$msa_file
