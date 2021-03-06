#!/bin/sh

shopt -s globstar

results=$(awk "match(\$0, $1, res) {print res[1] \" \" FILENAME}" $2 | sort | uniq -D -w 38)

# echo "results"
# echo "$results"
# echo " "

if [ -z "$results" ]
then
    exit 0
fi

linecount=$(echo "$results" | wc -l)

# echo "linecount"
# echo "$linecount"
# echo " "

results=$(echo $results | sed "s/[\n]//g")

# echo "results"
# echo "$results"
# echo " "

read -a resultsarray <<< $results

# echo "{resultsarray[@]}"
# echo "${resultsarray[@]}"
# echo " "

uuids=$(curl "https://www.uuidtools.com/api/generate/v4/count/$linecount")

# echo "uuids"
# echo "$uuids"
# echo " "

uuids=$(echo $uuids | sed 's/[]\"[]//g' | sed 's/,/ /g')

# echo "uuids"
# echo "$uuids"
# echo " "

read -a uuidarray <<< $uuids

# echo "{uuidarray[@]}"
# echo "${uuidarray[@]}"
# echo " "
# echo "${uuidarray[0]}"
# echo "${uuidarray[1]}"
# echo "${uuidarray[2]}"
# echo "${uuidarray[3]}"

i=0
while [ "$i" -lt "$linecount" ]
do
    # echo "new"
    # echo "${uuidarray[i]}"
    # echo " "

    # echo "olduuid"
    # echo "${resultsarray[i*2]}"
    # echo "filename"
    # echo "${resultsarray[i*2+1]}"
    # echo " "

    awk "NR==1,/${resultsarray[i*2]}/{sub(/${resultsarray[i*2]}/,\"${uuidarray[i]}\")} 1" "${resultsarray[i*2+1]}" > temp_file && mv temp_file "${resultsarray[i*2+1]}"

    i=$((i + 1))
done