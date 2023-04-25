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
elif [[ "$1" == "--help" ]]; then
    echo "Flagi: --data | --logs | --logs [x]"
    echo "--date: Wyswietlanie dzisiejszej daty"
    echo "--logs: Utworzenie 100 plikow logx.txt, gdzie x to numer pliku. W kazdym pliku znajduje sie informacja o: nazwie pliku, nazwe skryptu ktory go utworzyl oraz date utworzenia"
    echo "--logs [x]: Analogicznie jak wyzej, gdzie x to liczba utworzonych plikow"
else
    echo "Blad!!"
fi