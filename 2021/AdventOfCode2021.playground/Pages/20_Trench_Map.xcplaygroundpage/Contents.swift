import Foundation

let testAlgorithm = """
..#.#..#####.#.#.#.###.##.....###.##.#..###.####..#####..#....#..#..##..###..######.###...####..#..#####..##..#.#####...##.#.#..#.##..#.#......#.###.######.###.####...#.##.##..#..#..#####.....#.#....###..#.##......#.....#..#..#..##..#...##.######.####.####.#.#...#.......#..#.#.#...####.##.#......#..#...##.#.##..#...##.#.##..###.#......#.#.......#.#.#.####.###.##...#.....####.#..#..#.##.#....##..#.####....##...##..#...#......#.#.......#.......##..####..#...#.#.#...##..#.#..###..#####........#..####......#..#
"""

let gameOfLife = """
.......#...#.##....#.###.######....#.##..##.#....######.###.#......#.##..##.#....######.###.#....##.#...#.......###.#...#..........#.##..##.#....######.###.#....##.#...#.......###.#...#........##.#...#.......###.#...#.......#...............#..................#.##..##.#....######.###.#....##.#...#.......###.#...#........##.#...#.......###.#...#.......#...............#................##.#...#.......###.#...#.......#...............#...............#...............#...............................................
"""

let testInput = """
...............
...............
...............
...............
...............
.....#..#......
.....#.........
.....##..#.....
.......#.......
.......###.....
...............
...............
...............
...............
...............
"""

let realAlgorithm = """
####....##..####..##.#.#.##..##...##.####....####.##..#.######.#####..##.#..#..#..###.#..###........#...########...#.#........#...####...#...##...####..###..#..#..##..#####...##.######...###.##.##..#...##....#.#...#.######.##.##.#..#.#..#..####.#####....#.##.####..#.##..#...##.#.#####.#..##......###.#..###.##.#.#..##...###..#..#..#.###...##.#....#.....##...##..#.##.#.#.....###..#.#...####..#..##.####...###...##...###..#....####..####..#.###.###.##.#.#.#.###.##.#.#.#..#.#...##...#.#.##..#..###.##..##.###.##.
"""

let realInput = """
#.#....#...#..#.....###.....#...##.#####.#.#.##.#.###.###.##.##.........########......##...#....##..
..#.#..#...#.###...#..#..#.....###.#.#.##.#.##.#..###.###.#..#.##.#.##.#.#.#...####.#.......#..##...
##..##...#.#########.###..#####..###.###.####....###.#.#.###.#.#..#..#.#...####..###.#.##.#####.##..
.#.##....##..#.###..#....#.#..##..####.#..#.#####.#.#...#.....#.##.#.#.#...#..#......#.#.#.##..#.#.#
##..#.##.#.#.#.##....####.#.#.....#.....#....#....#...###..###..######.#...#.#.....#.#.##...##..##..
###..#......##.....#..##.#.#...#...#.##..##..###.####...###.#...##.#.#.#.##.#....###...######...#.##
...##.#..#.#.#.####.####..#.#.#.##.#...#.....#.#..#.#####..###.#...#..#...####...#....##..##..#....#
.#.#.....##...#.##..#.##..##.#######.##..#...#..#.######.#.##..#..#......###.#..##.#.#...###.##..#..
.##.#######.##..#...#..###.###...##.##..#.#...#..#.#..###.##.#..#.##.#.#.##.####..#..###.###.##.#.#.
#..###...#.####.#...##.###...##..#.######..#.#........##.#...#..#.##.#....#####...#..#.#.##.#....###
#..####.#.#.##..#.#.##...#...###....#...#.....###..##...##.#.##.#....##..##.##.#####.#.#.##.###..##.
####.####..#.#..###.#..#####......#...####.##.#..##.##..#...#..#.#####...#...#...###.##.##........##
#.....###..#.###.#...##.#####...###...###.#.##.###.###.##.####..#..#.....#...##.#.....#.##..#..#....
.##..#.######..#.#.#.....#.#..###.#.####.##.#...##..#..#.#.##..#.....#.####.#.#.#...##.##..#......##
#.##...###.##.##.#...####.#..#...#.#..#.###.#.#.##.##..###.##.##.#..##..#.#.#.#..#.###.#...###..#.##
###...#.#.##.#.#.#.##.#.###.##..#.#.##..#.##..####.##..#...##.#.###....###..###..###.#..#.##..#.#.##
.......###...#####.#####.#.####..#....##.##.###.#.#.#.#.#...#.#.###.####.#..###.####.#.#..#..#######
#.#........###..###..#...####..##.#..####....#.#...##.#....#..###..##......#..###....###.#.###...#.#
...#.#....#...##..###.##.####.....####.........#..#..#.#.#.###.#..##.####........###.###.#..#.#...#.
##.######...###.....#.##..#..##..#.#.#..#...#.#...##.#.##...######.#.#...###..#.########.#.##.###...
##..#..#..#.##...#.##.........##..#####.#.##.#.####...#.#.#...#...##.####..#...######..#.....##..#..
...#..#.###..#.##.###...#....#..#...#.###..####.#..######.##..#....##...####...##..#.#.#.###.###....
.##.###..####.##....#....######...#..####.##...###.##.#.#.##..##.....####.#..#.###.##...#....####.##
####.######.#..#...###.#.#.#.....####....#.#..#....##...##.#######.#..#..#.######.##......#...##...#
.#####..#..##...###.###.#.#....###.###.##...#.#...#..#..#..#.........#.##..#.....#....####..####.###
#..##.#.###.#......##...#.###..##.##.#.#..#.#.##..###.#..........#..#...#.###.###..###.#.#..#..#....
......#.####..#.####..#....##..####.##..#....##.#.#........#.#####..###....###..###.#..#.#.#.#.##.##
#..#.....####.#.##.#..#..#...#.#..##..##.#.#.####..#...#..#.#.#.#....#.###.###..##.#.#...###.###.#..
.##..#..####.##.#...####...#.#.#.#.#.#..#.#...##..#....#.#..#..#.#.##..#.#..##..#.#.#...##..###.##..
..#.#..#.....##.###.##.#####.......###..##.##..#..###..##..#.....##.#.#.....##.#########.####.#.####
##....####..#....#.########...##.###....#......#..###..###.#.####.##.#######.#############...#.##.#.
##..##....#..#..#...#.#.#.##..##..#.###....##..#..##.#.#...#.....#....#..#....#.###.#...#...#.##..##
##.#..##..#..###.##.....#..#.##...##....#.#..##.#.....#.#...##......##########.....#....#.####......
.###.#....##..#..##..#####.###.#.##.#.####..###.#.###..#.##....####..#.#...#.#.#..#####...####.##..#
....#..####..#.......#.#.......##...##.#.###..##.........##..##...##.#..###..#.#....#.####.#...#.###
#.#.#.####.#.#.#.#....##.#...#..##.#.##..##.#.##..#.#..#.#.#..#####..###.#..#..#.#..##.#...#..#..#.#
.#..##....##.#...#.......###.#####.#........#.###.###.###..##.###...#.#....#...####.###.##..###.##..
.#.##.##.#.#..####.#..##.###..##..##.##.#.#####..#..#.#..#.##.#.####.#.##.#...##....#.....#.####.##.
##.##.#.#########.#....##.##.#####....#..#..###.#..##.#..##.#.#.#######.##.#......##.##..#.####...#.
#.....#.##...##...##.#.#...###.#####.#.##.####.##.#..#..##.#####.##..###.......#.#...##...#..###.#.#
.#.#####.##.##.#.#..##...#..#.#####...#.##.####.##.#.#.##.#.##.#..#....#.....###..##.##.##.#.#.#.###
##.##.#.#.#..#..#..##.#####.#...##.#...##..#.#..#..#.#...#.###..###.#...#..##...###.......#...#.#.#.
.#.....#..##......#.#..###.#..#.##..##.#.....##.##...#....#.##.#......#.#..#..###..#.#..####.##..###
...###.....#.##..####.##.#.#...#.......##..###.###..##.#.#....#...#.#..#.###.####..###...#....#...#.
..#.....#...###.##.##.#....#.##..#.#####..###.####.##..#.##.##.##..#.#.###.#.#.#...##....###.#.##...
.#########...#...##..###.#.###.#...#...#.###.###..###....###..#.##...##.#.#...#.#.####..#..#...#####
##..##..#..#....#....#####....###...#.##.###.#.#.#.....#..##..###.#.#..##.#.#..##....#.###.##..#..##
.....#.##...##......#..#.####....#.##.#####...#..#..#.###..####..#.####.##..#.####.#.#.....###..#..#
###....##.#..##....#####..#.#####.####....#....##.......#####.#...#.....#..#.###...##.#..#.###..#.##
#.##..#...##...##.#.###.###.#.#...#...#..#####.#..#.###.#.##.###.####...#.#.##..##.#.######.###..#..
.#.####...##.###.#.....#.##########.###.#####...###.#...###.#....#..##..##....##.##....#.##...#.##.#
###..#.#######.##.#####..######......#.#..#.#..#....######.##.###.###.#.##.#.##..#..##..###..##..###
....###.######.###.....##...#..#...##..###..########.#.##...####....##.###.#.##..##.#.....##.#.###..
#...#....#..##.#.#.#..#..#.#...#.#..#.###.######.##.####....#.##....##.###.##.##.......#.##..#.##...
###.#.#.#...#.#.#.#.#..#.####..##..##.##..##.#.##..##.###.####.#####..#.####...##.....#.#.##...#.##.
###.....#####.#...#.#....##...#..####...##.##.#..#.....#.##.#....######.##.##..#.#..#####.#...##...#
.#..##.###.###..#######.#.#.###...##.###.#.#.###.#.#####.##......#.##.....#..####.#.##.##.....#..###
##....##.#.##.#..#.##.###.##.####..#.##...#.#.##..##.#.#...##.#.#.##....#.#.#.....##....######.#.#.#
...#.##.#.#.#....#.###.#.###...##....#..#..##...#.##.#.....##.#.###...###...#.#...###.#.##.##..##.##
.#.#..#..#....##....#######..#...##.##.....#..###.##.#..#....#..##.##.#...#####.#....##....######.##
#.#.##..##..###.....#.##.##.###...###.##.#.#...#....####.......#....#..##.##...##....#...#.####..###
.#.##..#.....######.##..##.###....#####..#...#.####..##..#.#.###...####....#.##....###.##..######...
..###.######..###.....#...#.#..##....##..#...######.#.#.#...###.##....#.#..####.#######..##.....#..#
#...#.#####...#.###..#....#.#....#..#...##.#...#.#..#.##..##..#..##..#.#.###.#.#.##.#.##.......#####
###..#.##.#.#.#.....##.##.###..####....##..#..#..#.###..##.....#.....######.....#.###.#####.##.#####
.##..#.#.###.##.#.#.#..#......##...#..##.###..#.###.#.#.#...##.###...#.....#.##.#.#..##.##.#....##..
##.#..#.#####.##..#.#.##.###....###.......###......#..#...###.##.#.##########.##.##.##.###.#.##.....
.###.#..#####..##..#.####..#.#..######....####.###..#.##.####..#..#...##.#.#.####.####.#.##..####...
###.###.#.#.#..##..###..#....##.#..##.###.##.#.#......###....####.#......#.#.#...#.....##......####.
###.#.####.######..###..##.#.#....#####.#..#....#.##.##..#####.#......#...##....#..#.#.##..####.####
#..#...####..####.####.#..#.##..#.#.#.####..#.####...##....#..####.#.#........#.##......#.....##.#.#
..#..#.#####.#...#.###..##.#..#..#..#...#...#...###.#####.#.##..#.######...##.###....#######....#.##
.#.#........#.##.#.######.###.######..#..##.##.#...#.###.#..####.#.##.######.###..###..........#..##
..###.#.#..#.####...#.##...#....##############.#.#..####.###.#..##...#####.#.##.#..#####.#..#...###.
.#####.######.##...#.#.#..###.##..###.#.##.##....####..#.###...#.#.#...#..#..#.#..##......#..##.#...
.#.#..####.#.###.##..#.#.#.##..##.#..#.########..#..###...##....###.##.#...#.#.#.##.#..#.#..#..#..#.
.##...#.#.#####......##.####.####...#.#######..#..#...#..#####.#.........#####..#.###.#.#.##...##..#
#..#.#..#.#..##.#.##.###.#..##.#..#..####.###.##.########.#.##..#.....#..#....#.##..#..######..#####
.#.#...####..##..####....#.#.###.#.#...##.#.#..####.######..#.#.#.#...#..##...#....#####....####.##.
###...#.#..##..#.#..###.###...##.#..#.###..#.###..#.#...#.#..#.#..##...##..###.#.#....####..#....#.#
##....#.###.####..#.###.#..#######.###.....###...#.##....######.#.##..#####...###..#....##...#..###.
###....####......####.##.#..#...###.##..#...##..#.##..####..###.###..#..#..###..#.###...#.####..#..#
#...#...##..#...###...#..#####...#####.##...#..#.#####.....#####.......##..####....##.....##..#..##.
####..####.##..#.#..#####...#.#..##.#..##.###..#..###..#.....##.##..#..#.####.#..#..###.##..##..##..
####..#......##.#.#.#....#..###..####.##..##.###.##.....#......#.###...#...###.#..#..#.###.##.###...
..##.####..#..........###.#..##.####..#..##.##..##.####.#.##.####.....#.#.#..####.#####.##...#..####
..#....#..#.....#.##.#####.####...##.#.#.##..###..#.######.#.....##.######..#..#.##.##.#...#####.###
........#.#.....#.#.###...#######.#........#.#####.#.####...##.#.##..###...#......#.##.#.#.#..###.##
....#..##.#..#.###.....#...#..###.####.###.##..##...#.#..#....#.#.###.##.#..#...##.##..##..####..#.#
.#.#.##...#...#...#.#.#.####.####.#...#.#....#....##..#......#.#####.#.##.##.##.###...#.#####...#..#
###..##....#......########.##.##.##.##.#....####.###..#..##.##...#..##.#...##..##.####.####.##.#..##
#......###.###.##.....#.........#....###.#...##.###......##.#.....##..###.....##.##.###....##.#.#..#
.##.#.#.##.....#..#.#....#####.#.#...#.##..###.#####.###..###.##.....#.#...#..###..##..#...#.#..##..
########.#.#.##.#.##..#..#.#.#..#.###.#.##.######..#.####...##.##....###..#....#...#..#.#...##...#..
#....#.#####.#....######...##.#.###.#..####.##.###.###...####..#.#.##...#...##...##....####.#.......
..###..#..####.##.#.#####...###.#...###...#.#..##..##...##.##.#.##.#.#...##.....#..#.#.######.####.#
#..###.#..#.#..#.#.....##.#.#.#.#....#.#..#..#.###.#.##...#...##..###.#...#...#######..####..#.....#
#..####.#####....####.#.#.#.#.##.#.#...#####...##.###..###.#.#............###.####..##..##.###..###.
...#..#..#...#.#######.#.##..##..#..#.#..###.###..#.#####....#..#...####.#..##..###.##..######.##.##
##.#..#....#.#..###...#.#########.#####..#...#.####..#.#..#######.#....#.#.#.#..###.#.#..#...#.####.
"""

func parseInput(input: String) -> [[Int]] {
    input
        .split(separator: "\n")
        .map { $0.map { $0 == "." ? 0 : 1 } }
}

extension Array where Element == [Int] {
    subscript (x: Int, y: Int) -> Int? {
        indices.contains(y) && self[y].indices.contains(x)
            ? self[y][x]
            : nil
    }

    func neighboringValues(x: Int, y: Int) -> [Int] {
        [
            self[x - 1, y - 1], self[x + 0, y - 1], self[x + 1, y - 1],
            self[x - 1, y],     self[x + 0, y],     self[x + 1, y],
            self[x - 1, y + 1], self[x + 0, y + 1], self[x + 1, y + 1],
        ].compactMap { $0 }
    }

    mutating func addPadding(padding: Int, value: Int) {
        let width = first!.count

        let horizontalPadding = Array(repeating: [value], count: padding).reduce([], +)
        let verticalPadding = Array(repeating: Array(repeating: [value], count: width).reduce([], +), count: padding)
        self = (verticalPadding + self + verticalPadding).map { horizontalPadding + $0 + horizontalPadding }
    }

    mutating func enhance(algorithm: [Int]) {
        self = enumerated().map { y, row in
            return row.enumerated().map { x, value in
                var neighbors = neighboringValues(x: x, y: y)
                if neighbors.count < 9 {
                    neighbors = Array(repeating: [value], count: 9).reduce([], +)
                }
                let binary = bitArrayToInt(neighbors)
                return algorithm[binary]
            }
        }
    }

    var debugDescription: String {
        map { $0.map { $0 == 1 ? "#" : "." }.joined(separator: "") }
            .joined(separator: "\n") + "\n"
    }
}

// [0,0,0,1,0,0,0,1,0] -> 000100010 -> 34
func bitArrayToInt(_ arr: [Int]) -> Int {
    arr.reduce(into: 0) {
        $0 <<= 1
        $0 += $1
    }
}

let algorithm = gameOfLife.map { $0 == "." ? 0 : 1 }
var image = parseInput(input: testInput)

print(image.debugDescription)

//image.addPadding(padding: 3, value: 0)
//print(image.debugDescription)
//
//while true {
//    image.enhance(algorithm: algorithm)
//    image.addPadding(padding: 1, value: image.first!.first!)
//    print(image.debugDescription)
//}

//
//let litPixelCount = image
//    .reduce([], +)
//    .map { $0 == 1 ? 1 : 0 } // Map 9's back to 0's
//    .reduce(0, +)
//
//print("litPixelCount \(litPixelCount)")