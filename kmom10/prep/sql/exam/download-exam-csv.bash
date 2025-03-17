#!/usr/bin/env bash

url="https://docs.google.com/spreadsheets/d/1Ms0YQzXhGFMEZyeijc7FCYj-s8VRHTfDWGXJix7-6P8/gviz/tq?tqx=out:csv&sheet" #ersätt

for target in kraftverk konsument typ kraftverk2typ konsument2kraftverk ; do #ersätt
    printf "%s\\n" "$target"
    curl --silent "$url=$target" > "$target.csv"
done

ls -l -- *.csv
file -- *.csv



# # ge beörighet till filen
# chmod +x download-exam-csv.bash

# # köra skriptet
# ./download-exam-csv.bash

# #eller
# bash download-exam-csv.bash