import Foundation

let testInputPart1 = """
#############
#...........#
###B#C#B#D###
  #A#D#C#A#
  #########
"""

let inputPart1 = """
#############
#...........#
###D#A#B#C###
  #B#A#D#C#
  #########
"""

let inputPart2 = """
#############
#...........#
###D#A#B#C###
  #D#C#B#A#
  #D#B#A#C#
  #B#A#D#C#
  #########
"""

// Amber (A),
// Bronze (B),
// Copper (C), and
// Desert (D)

// Amber amphipods require 1 energy per step,
// Bronze amphipods require 10 energy,
// Copper amphipods require 100, and
// Desert ones require 1000

// - Amphipods will never stop on the space immediately outside any room.
// - Amphipods will never move from the hallway into a room unless that room is their destination
// and room and that room contains no amphipods which do not also have that room as their own destination.
// - Once an amphipod stops moving in the hallway, it will stay in that spot until it can move into a room.

//           111
// 0123456789012
// ############# 0
// #...........# 1
// ###B#C#B#D### 2
//   #A#D#C#A#   3
//   #########
//    A B C D
//    2 4 6 8

struct Amphipod {
    let x: Int
    let y: Int
    let kind: String
}

let costs = ["A": 1, "B": 10, "C": 100, "D": 1000]
let dests = ["A": 3, "B": 5, "C": 7, "D": 9]
var hallwaySpots = [1, 2, 4, 6, 8, 10, 11] // spots in the hallway we can stop

func parseInput(input: String) -> [[String]] {
    input
        .split(separator: "\n")
        .map { line in
            line.map { String($0) }
        }
}

let burrow = parseInput(input: inputPart1)
burrow.


print(burrow)
