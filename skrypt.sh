#!/bin/bash

if [[ "$1" == "--date" ]]; then
    echo "$(date +%d-%m-%Y)"
elif [[ "$1" == "--logs" ]]; then
    for i in {1..100}; do 
        echo "Nazwa pliku: log$i.txt" >> log$i.txt
        echo "Nazwa skryptu: skrypt.sh" >> log$i.txt
        echo "Data: $(date)" >> log$i.txt
    done
else
    echo "Blad!!"
fi