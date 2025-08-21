#!/bin/sh

input_string=$1

str_lower=$(echo "$1" | tr '[:upper:]' '[:lower:]' | tr ' ' '_' )

echo $str_lower



