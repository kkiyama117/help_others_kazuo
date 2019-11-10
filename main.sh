#!/bin/sh

# import other file
. ./conversion.sh

# function to call
__my_main () {
	PRE_IFS=$IFS
	IFS=$'\n'
	__answer=""

	for line in $@
	do
		__line_answer=`__my_convert "${line}"`
		# 末尾に結合
		# 全部雑にメモリに突っ込んでから出力してるので, 本当は良くないかもしれん
		# 
		__answer="$__answer\n$__line_answer"
	done
	echo "$__answer"
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
# 最後に \n 等を評価
echo -e `__my_main "${__str}"`

