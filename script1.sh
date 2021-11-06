#!/bin/sh

shopt -s globstar

awk "match(\$0, $1, res) {print res[1] \" \" FILENAME \":\" FNR}" $2 | sort | uniq -D -w 38 | node v2.js