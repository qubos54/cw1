#!/bin/bash

if [[ "$1" == "--date" ]]; then
    echo "$(date +%d-%m-%Y)"
elif [[ "$1" == "--logs" ]]; then
    if [[ "$2" =~ ^[0-9]+$ ]]; then
        liczba_plikow=$2
        for (( i=1; i<=$liczba_plikow; i++ )); do
            echo "Nazwa pliku: log$i.txt" > log$i.txt
            echo "Nazwa skryptu: skrypt.sh" >> log$i.txt
            echo "Data: $(date +%d-%m-%Y)" >> log$i.txt
        done
    else
        for i in {1..100}; do 
        echo "Nazwa pliku: log$i.txt" >> log$i.txt; echo "Nazwa skryptu: skrypt.sh" >> log$i.txt; echo "Data: $(date)" >> log$i.txt; 
        done
    fi
else
    echo "Blad!!"
fi