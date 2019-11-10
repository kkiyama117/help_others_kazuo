#!/bin/sh

# Function to convert line with rule.
__my_convert () {
	# Space charactor is dealt with charactor which separate words by default.
	# So, you need to escape it from 'IFS' to see args as one word.
	# If you should treat space as non-separate charactor, please comment out below.
	# PRE_IFS=$IFS
	# IFS=$'\n'

	# args is given
	if [ "$#" -ge 1 ]
	then
		if [ ${1:0:1} = ">" ]
		# if string start with '>',
		then
			# 空白文字の分割をしていない時
			# $1 -> ">1 chr1:1-249250621"
			if [ $# == 1 ]
			then
				# 前方から最初の空白文字を切り取り
				__var1=${1#* }
				set -- ${__var1}
			else
			# 空白文字の分割をしていた時
			# $1 -> ">1", $2 -> "chr1:1-249250621"
			# $1 を消去してスライド
				shift
			fi
			# $1 -> "chr1:1-249250621"
			# 後方一致で切る
			# 正規表現のワイルドカード * をつかう
			var1=${1%%:*}
			# $var1 -> "chr1"
			echo -e ">${var1}\n"
			return 0
		else
			echo -e "$1\n"
			return 0
		fi
	# no argument
	else
		return 1
	fi
	# Revert IFS
	# $IFS=PRE_IFS
	# 引っかからないと異常終了
	return 1
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
PRE_IFS=$IFS
IFS=$'\n'

for line in $__str
do
	__line_answer=`__my_convert "${line}"`
	echo -e "$__line_answer"
done

IFS=$PRE_IFS

exit 0
