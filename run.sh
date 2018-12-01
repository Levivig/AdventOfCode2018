#!/bin/bash

case $# in
    1)
        app="day$1"
        folder="Day$1"
        swiftc -o ./$folder/$app ./$folder/main.swift ./AdventOfCode2018/Utilities.swift
        chmod +x ./$folder/$app
        ./$folder/$app;;
    *)
        echo "usage: ./run.sh {n}, where n is the day you want to run"
        exit;;
esac
