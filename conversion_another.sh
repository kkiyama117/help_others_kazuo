#! /bin/sh

# Function to convert line with rule.
MyConvert () {
	# Space charactor is dealt with charactor which separate words by default.
	# So, you need to escape it from 'IFS' to see args as one word.
	# If you should treat space as non-separate charactor, please comment out below.
	# PRE_IFS=$IFS
	# IFS=$'\n'

	# if $1 is '' ( empty string ),
	if [ -z $1 ] 
	then
		# return standard error.
		return 1
	elif [ ${1:0:1} = ">" ]
	# if string start with '>',
	then
		# 前方から空白文字まで削除
		# (後方置換で
		var1=${2%%:*}
		echo $var1
		return 0
	else
		echo $1
		return 0
	fi
	# Revert IFS
	# $IFS=PRE_IFS
}

echo $1
MyConvert ${1}
# if you want to call 'MyConvert' with only one arg even if it includes space charactor, use below
# MyConvert "$1"
