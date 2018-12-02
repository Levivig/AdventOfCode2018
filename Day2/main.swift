//
//  main.swift
//  Day2
//
//  Created by Levente Vig on 2018. 12. 01..
//  Copyright © 2018. Levente Vig. All rights reserved.
//

import Foundation

// MARK: Get input data
let input = read(file: "data", of: "txt")

// MARK: - Part 1
func find(exactly number: Int, character: Character, in string: String) -> Bool {
    var count = 0

    for char in string where char == character {
        count += 1
    }

    if count == number {
        return true
    } else {
        return false
    }
}

var doubleLetterCodes = 0
var tripleLetterCodes = 0

for code in input {
    var deltaDobule = 0
    var deltaTriple = 0
    for val in UnicodeScalar("a").value...UnicodeScalar("z").value {
        if let char = UnicodeScalar(val) {

            if find(exactly: 2, character: Character(char), in: code) {
                deltaDobule += 1
            }
            if find(exactly: 3, character: Character(char), in: code) {
                deltaTriple += 1
            }
        }
    }
    if deltaDobule >= 1 {
        doubleLetterCodes += 1
    }
    if deltaTriple >= 1 {
        tripleLetterCodes += 1
    }
}

print("Part 1: \(doubleLetterCodes * tripleLetterCodes)")

// MARK: - Part 2
func distanceHamming(between string1: String, string2: String) -> Int {
    guard string1.count == string2.count else { return Int.max }

    var dist = 0
    for idx in 0..<string1.count {
        let index = string1.index(string1.startIndex, offsetBy: idx)
        if string1[index] != string2[index] {
            dist += 1
        }
    }
    return dist
}

private func getResult(_ code1: String, code2: String) -> String {
    var res: String = ""
    for idx in 0..<code1.count {
        let index = code1.index(code1.startIndex, offsetBy: idx)
        res = code1.filter({_ in code1[index] == code2[index]})
    }
    return res
}

measure {
    for (idx, code) in input.enumerated() {
        for idx2 in idx+1..<input.count {
            let code2 = input[idx2]
            if distanceHamming(between: code, string2: code2) <= 1 {
                print("Part2: \(getResult(code, code2: code2))")
                break
            }
        }
    }
}
