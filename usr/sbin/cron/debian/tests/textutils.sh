# textutils.sh: this file can be sourced in shell scripts

# function frame
# usage:
#        frame "abcd efgh" ij
# yields:
# +-------------+
# |  abcd efgh  |
# |  ij         |
# +-------------+
frame(){
    content=""
    maxlen=0
    while [ -n "$1" ]; do
	content="${content}|:$1:|\n"
	len=${#1}
	if [ $maxlen -lt $len ]; then
	    maxlen=$len
	fi
	shift
    done
    l=+$(seq $(( maxlen + 4 )) | sed 's/.*/-/'| tr -d "\n")+
    echo $l
    printf "${content}" | column -t -s ":"
    echo $l
}

# function abort
# stops the script and exits with non-zero status
#
# if a parameter is provided, call the function frame with it
#  and redirect the result to stderr
abort(){
    if [ -n "$1" ]; then
	frame "$1" 1>&2
    fi
    exit 1
}
