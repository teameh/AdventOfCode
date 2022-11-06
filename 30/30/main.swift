//
//  main.swift
//  30
//
//  Created by Tieme van Veen on 22/12/2021.
//

import Foundation

print("Hello, World!")

let testInput: [(Bool, (x: (Int, Int), y: (Int, Int), z: (Int, Int)))] = [
    (true, (x: (-20,26), y: (-36,17), z: (-47,7))),
    (true, (x: (-20,33), y: (-21,23), z: (-26,28))),
    (true, (x: (-22,28), y: (-29,23), z: (-38,16))),
    (true, (x: (-46,7), y: (-6,46), z: (-50,-1))),
    (true, (x: (-49,1), y: (-3,46), z: (-24,28))),
    (true, (x: (2,47), y: (-22,22), z: (-23,27))),
    (true, (x: (-27,23), y: (-28,26), z: (-21,29))),
    (true, (x: (-39,5), y: (-6,47), z: (-3,44))),
    (true, (x: (-30,21), y: (-8,43), z: (-13,34))),
    (true, (x: (-22,26), y: (-27,20), z: (-29,19))),
    (false, (x: (-48,-32), y: (26,41), z: (-47,-37))),
    (true, (x: (-12,35), y: (6,50), z: (-50,-2))),
    (false, (x: (-48,-32), y: (-32,-16), z: (-15,-5))),
    (true, (x: (-18,26), y: (-33,15), z: (-7,46))),
    (false, (x: (-40,-22), y: (-38,-28), z: (23,41))),
    (true, (x: (-16,35), y: (-41,10), z: (-47,6))),
    (false, (x: (-32,-23), y: (11,30), z: (-14,3))),
    (true, (x: (-49,-5), y: (-3,45), z: (-29,18))),
    (false, (x: (18,30), y: (-20,-8), z: (-3,13))),
    (true, (x: (-41,9), y: (-7,43), z: (-33,15))),
    (true, (x: (-54112,-39298), y: (-85059,-49293), z: (-27449,7877))),
    (true, (x: (967,23432), y: (45373,81175), z: (27513,53682)))
]

typealias Point = (x: Int, y: Int, z: Int)
typealias Instruction = (
    x: ClosedRange<Int>,
    y: ClosedRange<Int>,
    z: ClosedRange<Int>,
    value: Bool
)

//struct Instruction {
//    let x: ClosedRange<Int>
//    let y: ClosedRange<Int>
//    let z: ClosedRange<Int>
//
//    let value: Bool
//}

let instructions = testInput.map { instruction -> Instruction in
    let (value, ranges) = instruction
    return Instruction(
        x: min(ranges.x.0, ranges.x.1)...max(ranges.x.0, ranges.x.1),
        y: min(ranges.y.0, ranges.y.1)...max(ranges.y.0, ranges.y.1),
        z: min(ranges.z.0, ranges.z.1)...max(ranges.z.0, ranges.z.1),
        value: value
    )
}

instructions.reduce(<#T##initialResult: Result##Result#>, <#T##nextPartialResult: (Result, Instruction) throws -> Result##(Result, Instruction) throws -> Result##(_ partialResult: Result, Instruction) throws -> Result#>)

//typealias Point = (x: Int, y: Int, z: Int)

//let size: (Point, Point) = testInput.reduce((Point, Point)) { res, instruction in
//    return (
//        Point(x: min(res.0.x.0, instruction.1.x), min(res.0.y, instruction.1.y), min(res.0.z, instruction.1.z))
//        Point(x: max(res.0.x.0, instruction.1.x), max(res.0.y, instruction.1.y), max(res.0.z, instruction.1.z))
//    )
//}

