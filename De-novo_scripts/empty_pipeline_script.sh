#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l virtual_free=2G

read -r -d '' HELP << EOM
#################################################################################
#										#
#	Wrapper script for PHIX filtering				#
#										#
#	usage: filter.sh -p <program> [options]					#
#										#
#	-p currently ignore, bowtie is only option				#
#										#
#										#
#################################################################################
EOM

function print_help {
	echo;echo "$HELP" >&1;echo;
	exit 0
}

if [ $# -eq 2 ];
then
   print_help
fi

OPTIND=1

while getopts ":hs:" options; do
	case "$options" in
	s)
	  SCRIPT_DIR=$OPTARG
	  ;;		  
	h)  
	  print_help
	  exit 0
	  ;;
	esac
done

shift $((OPTIND-1))

[ "$1" = "--" ] && shift

if [[ -z "$SCRIPT_DIR" ]]; then 
	SCRIPT_DIR=$(readlink -f ${0%/*})
fi

qsub $SCRIPT_DIR/submit_filter.sh $SCRIPT_DIR $@
