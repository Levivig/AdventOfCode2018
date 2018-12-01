//
//  main.swift
//  Day1
//
//  Created by Levente Vig on 2018. 11. 11..
//  Copyright © 2018. Levente Vig. All rights reserved.
//

import Foundation

// MARK: Get the input date
let input = read(file: "data", of: "txt")
let numberInput = input.compactMap({Int($0)})

// MARK: - Part 1
let result1 = numberInput.reduce(0, +)
print("Part 1: \(result1)")

// MARK: - Part 2
var currentFreq = 0
var seen: Set = [currentFreq]

var index = 0
while true {
    let change = numberInput[index]
    currentFreq += change

    if seen.insert(currentFreq).inserted {
        // New frequency value
    } else {
        print("Part 2: \(currentFreq)")
        break
    }
    index = (index + 1) % numberInput.count
}
