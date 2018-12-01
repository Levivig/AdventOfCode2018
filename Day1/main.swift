//
//  main.swift
//  Day1
//
//  Created by Levente Vig on 2018. 11. 11..
//  Copyright © 2018. Levente Vig. All rights reserved.
//

import Foundation

let input = read(file: "data", of: "txt")
let numberInput = input.compactMap({Int($0)})
let result = numberInput.reduce(0, +)

print(result)
