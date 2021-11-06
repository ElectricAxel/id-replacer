#!/bin/sh

shopt -s globstar

awk '/ *id: ?\47[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\47.*$/ {print $2 " " FILENAME ":" FNR}' workflows/*/src/**/*.ts | sort | uniq -D -w 38 | node v2.js