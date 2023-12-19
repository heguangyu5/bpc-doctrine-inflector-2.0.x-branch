#!/bin/bash

[[ "$1" == "" ]] && {
    echo "Usage: ./bpc-prepare.sh src.list"
    exit
}

rm -rf ./Doctrine/Inflector
rsync -a                        \
      --exclude=".*"            \
      -f"- Doctrine/"           \
      -f"+ */"                  \
      -f"- *"                   \
      ./                        \
      ./Doctrine

echo "placeholder-inflector.php" > ./Doctrine/src.list

for i in `cat $1`
do
    if [[ "$i" == \#* ]]
    then
        echo $i
    else
        echo $i >> ./Doctrine/src.list
        filename=`basename -- $i`
        if [ "${filename##*.}" == "php" ]
        then
            echo "phptobpc $i"
            phptobpc $i > ./Doctrine/$i
        else
            echo "cp       $i"
            cp $i ./Doctrine/$i
        fi
    fi
done
cp bpc.conf Makefile ./Doctrine/
