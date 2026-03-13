#!/usr/bin/env bash

file=$1
width=$2
height=$3

mime=$(file --mime-type -Lb "$file")

case "$mime" in
    image/*)
        chafa --size=${width}x${height} "$file"
        ;;
    text/*)
        sed -n '1,200p' "$file"
        ;;
    *)
        file "$file"
        ;;
esac
