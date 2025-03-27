#!/usr/bin/env bash

url="https://docs.google.com/spreadsheets/d/1z4weablhFYCTEgsLZlOpTgZqmt7x02iZ6MntBzf-Z94/gviz/tq?tqx=out:csv&sheet" #ersätt

for target in mineral country mineral2country miner miner2mineral ; do #ersätt
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