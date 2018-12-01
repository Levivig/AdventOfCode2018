//
//  Utilities.swift
//  Day1
//
//  Created by Levente Vig on 2018. 12. 01..
//  Copyright © 2018. Levente Vig. All rights reserved.
//

import Foundation

func read(file: String, of type: String) -> [String] {
    if let path = Bundle.main.path(forResource: file, ofType: type) {
        do {
            let data = try String(contentsOfFile: path, encoding: .utf8)
            let lines = data.components(separatedBy: .newlines)
            return lines
        } catch {
            print(error)
        }
    }
    return [""]
}
