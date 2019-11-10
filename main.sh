#!/bin/sh

# import other file
. ./conversion.sh

# function to call
__my_main () {
	PRE_IFS=$IFS
	IFS=$'\n'

	for line in $@
	do
		__line_answer=`__my_convert "${line}"`
		echo "$__line_answer\n"
	done
	IFS=$PRE_IFS
	return 0
}


# run script file
# パラメータの受け取り
# pipe でも引数でも受け取れるようにした
if [ -p /dev/stdin ]; then
	if [ "`echo $@`" == "" ]; then 
		__str=`cat -`
	else
		__str=$@
	fi
else
	__str=$@
fi
# 処理
echo -e `__my_main "${__str}"`

