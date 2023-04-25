#!/bin/bash

if [[ "$1" == "--date" ]]; then
    if [[ "$2" == "-d" ]]; then
        echo "--date -d dziala!!"
    elif [[ "$2" == "" ]]; then
        echo "$(date +%d-%m-%Y)"
    elif [[ "$2" != "-d" ]]; then
        echo "zla flaga"
    fi

elif [[ "$1" == "--logs" ]]; then
    if [[ "$2" =~ ^[0-9]+$ ]]; then
        liczba_plikow=$2
        for (( i=1; i<=$liczba_plikow; i++ )); do
            echo "Nazwa pliku: log$i.txt" > log$i.txt
            echo "Nazwa skryptu: skrypt.sh" >> log$i.txt
            echo "Data: $(date +%d-%m-%Y)" >> log$i.txt
        done
    elif [[ "$2" == "-l" ]]; then
        echo "--logs -l dziala!!"
    elif [[ "$2" == "" ]]; then
        for i in {1..100}; do 
        echo "Nazwa pliku: log$i.txt" >> log$i.txt; echo "Nazwa skryptu: skrypt.sh" >> log$i.txt; echo "Data: $(date)" >> log$i.txt; 
        done
    elif [[ "$2" != "-d" ]]; then
        echo "zla flaga"
    fi

elif [[ "$1" == "--help" ]]; then
    if [[ "$2" == "-h" ]]; then
        echo "--help -h dziala!!"
    elif [[ "$2" == "" ]]; then
        echo "Flagi: --data | --logs | --logs [x]"
        echo "--date: Wyswietlanie dzisiejszej daty"
        echo "--date -d: Wyswietla komunikat"
        echo "--logs: Utworzenie 100 plikow logx.txt, gdzie x to numer pliku. W kazdym pliku znajduje sie informacja o: nazwie pliku, nazwe skryptu ktory go utworzyl oraz date utworzenia"
        echo "--logs -l: Wyswietla komunikat"
        echo "--logs [x]: Analogicznie jak wyzej, gdzie x to liczba utworzonych plikow"
        echo "--error: Dziala jak logs"
        echo "--error -e 30: Wyswietla komunikat (nie dziala)"
        echo "--error [x]: Dziala jak logs [x]"
        echo "--init: klonuje całe repozytorium do katalogu w którym został uruchomiony oraz ustawia ścieżkę w zmiennej środowiskowej PATH"
    elif [[ "$2" != "-h" ]]; then
        echo "zla flaga"
    fi

elif [[ "$1" == "--init" ]]; then
    git clone https://github.com/qubos54/cw1.git
    export PATH=$PATH:$(pwd)

elif [[ "$1" == "--error" ]]; then
    if [[ "$2" =~ ^[0-9]+$ ]]; then
        liczba_plikow=$2
        for (( i=1; i<=$liczba_plikow; i++ )); do
            mkdir error$i; cd error$i
            echo "Nazwa pliku: error$i.txt" > error$i.txt
            echo "Nazwa skryptu: skrypt.sh" >> error$i.txt
            echo "Data: $(date +%d-%m-%Y)" >> error$i.txt
            cd ..
        done
    elif [[ "$2" == "-e 30" ]]; then
        echo "--error -e 30 dziala!!"
    elif [[ "$2" == "" ]]; then
        for i in {1..1}; do 
            mkdir error$i; cd error$i
            echo "Nazwa pliku: error$i.txt" > error$i.txt
            echo "Nazwa skryptu: skrypt.sh" >> error$i.txt
            echo "Data: $(date +%d-%m-%Y)" >> error$i.txt
            cd ..
        done
    elif [[ "$2" != "-e 30" ]]; then
        echo "zla flaga"
    fi

else
    echo "Blad!!"
fi