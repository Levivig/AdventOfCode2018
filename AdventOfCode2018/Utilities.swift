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

@_transparent
@discardableResult
public func measure(label: String? = nil, _ block: @escaping () -> Void) -> CFAbsoluteTime {
    let start = CFAbsoluteTimeGetCurrent()
    block()
    let end = CFAbsoluteTimeGetCurrent()
    if let label = label {
        print(label, "▿")
        print("\tExecution time: \(end - start)s\n")
    } else {
        print("Execution time: \(end - start)s\n")
    }
    return end - start
}
