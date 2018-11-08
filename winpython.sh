#!/bin/bash

file_name=$1
drive=`echo ${file_name:0:2}`

if [ $drive == "C:" ]; then
	filepy=$(echo $1 | sed 's#\\#/#g' | sed 's#C:/Users/<YOUR USER>#/home/<YOUR USER>#g' | sed 's#CURRENT/###g')
elif [ $drive == "L:" ]; then
	filepy=$(echo $1 |  sed 's#\\#/#g' | sed 's#L:/#/home/<YOUR USER>/#g')
fi

cd `dirname $filepy`
while : ; do
	home=`pwd`
	if [ -e bin/activate ]; then
		source bin/activate;
		break;
	fi
	if [ $home == "/home/<YOUR USER>" ]; then
		break
	fi
	cd ..
done

cd `dirname $filepy`
python $filepy
