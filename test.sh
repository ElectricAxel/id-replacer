#!/bin/sh

awk '/ *id: ?\47[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\47.*$/ {print $2 " " FILENAME}' workflows/*/src/*.ts workflows/*/src/**/*.ts | sort | uniq -D -w 38 | node v2.js