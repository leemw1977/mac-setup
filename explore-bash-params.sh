#!/usr/bin/env bash
#
# Adapted from https://www.shellscript.sh/examples/getopt/
#
set -euo pipefail

alpha=unset
beta=unset
gamma=unset
delta=unset

usage(){
  >&2 cat << EOF
Usage: $0
   [ -a value | --alpha value ]
   [ -b value | --beta value ]
   [ -g value | --gamma value ] 
   [ -d value | --delta value ]
   <infile> [infiles]
EOF
  exit 1
}

# If no arguments are provided, show usage
if [[ $# -eq 0 ]]; then
  usage
fi

# Parse options with getopt (all options expecting a value)
args=$(getopt -o a:b:c:d:g: --long alpha:,beta:,gamma:,delta:,help -- "$@")
if [[ $? -gt 0 ]] || [[ -z "$args" ]]; then
  usage
fi

# Apply the parsed options to positional parameters
eval set -- "$args"

# Process the options
while :
do
  case $1 in
    -a | --alpha)   alpha=$2   ; shift 2 ;;  # Assign the value to alpha
    -b | --beta)    beta=$2    ; shift 2 ;;  # Assign the value to beta
    -c | --gamma)   gamma=$2   ; shift 2 ;;  # Assign the value to gamma
    -d | --delta)   delta=$2   ; shift 2 ;;  # Assign the value to delta
    --help)         usage      ; shift ;;  # Show usage
    --) shift; break ;;  # End of options
    *) >&2 echo Unsupported option: $1
       usage ;;
  esac
done

# Check if no infile was provided
if [[ $# -eq 0 ]]; then
  usage
fi

# Output the results
>&2 echo "alpha   : ${alpha}"
>&2 echo "beta    : ${beta}"
>&2 echo "gamma   : ${gamma}"
>&2 echo "delta   : ${delta}"
>&2 echo "Parameters remaining are: $@"
exit 0
