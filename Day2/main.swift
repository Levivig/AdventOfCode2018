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
func levDis(_ str1: String, _ str2: String) -> Int {
    let empty = [Int](repeating: 0, count: str2.count)
    var last = [Int](0...str2.count)

    for (idx, char1) in str1.enumerated() {
        var cur = [idx + 1] + empty
        for (jdx, char2) in str2.enumerated() {
            cur[jdx + 1] = char1 == char2 ? last[jdx] : min(last[jdx], last[jdx + 1], cur[jdx]) + 1
        }
        last = cur
    }
    return last.last!
}

for idx in 0..<input.count {
    let code = input[idx]
    for idx2 in idx+1..<input.count {
        let code2 = input[idx2]
        if levDis(code, code2) <= 1 {
            let arr1 = NSMutableOrderedSet(array: Array(code))
            let arr2 = NSMutableOrderedSet(array: Array(code2))
            _ = arr1.intersect(arr2)
            if let res = arr1.array as? [Character] {
                let answer = res.map({String($0)})
                print("Part 2 :\(answer.joined())")
            }
        }
    }
}
