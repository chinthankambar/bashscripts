#!/bin/sh

directory=$1

if [ -d "$directory" ];
then
    echo "Organizing directory: $directory"
else
    echo "Input is not a valid directory"
    exit 1
fi

for each_file in "$directory"/*;
do
    if [ -f "$each_file" ];
    then
        base_file_name=$(basename "$each_file")
        file_extension="${base_file_name##*.}"
	file_extension=$(echo "$file_extension" | tr '[:upper:]' ':lower:')
	if ! [ -d "$directory/$file_extension" ];
	then
 	    mkdir "$directory/$file_extension"
	fi
	echo "Moving file $each_file to $directory/$file_extension"
	mv "$each_file" "$directory/$file_extension"
    fi
done
