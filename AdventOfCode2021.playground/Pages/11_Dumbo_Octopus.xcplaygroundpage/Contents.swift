import Foundation

let testInput = """
5483143223
2745854711
5264556173
6141336146
6357385478
4167524645
2176841721
6882881134
4846848554
5283751526
"""

let input = """
6636827465
6774248431
4227386366
7447452613
6223122545
2814388766
6615551144
4836235836
5334783256
4128344843
"""

class Octopus: Equatable, Codable {
    var x: Int
    var y: Int
    var energy: Int

    init(x: Int, y: Int, energy: Int) {
        self.x = x
        self.y = y
        self.energy = energy
    }

    func increase() -> Octopus {
        Octopus(x: x, y: y, energy: energy + 1)
    }

    func flash() -> Octopus {
        Octopus(x: x, y: y, energy: 0)
    }

    func isNeighbor(of other: Octopus) -> Bool {
        abs(other.x - x) <= 1 && abs(other.y - y) <= 1
    }

    static func == (rhs: Octopus, lhs: Octopus) -> Bool {
        rhs.x == lhs.x && rhs.y == lhs.y
    }
}

extension Array where Element == Octopus {
    func nextStep() -> (newOctopi: [Octopus], flashCount: Int) {
        var newOctopi = map { $0.increase() }
        var flashedThisStep = [Octopus]()

        while true {
            let flashing = newOctopi.filter { $0.energy > 9 }
            flashedThisStep.append(contentsOf: flashing)
            if flashing.isEmpty {
                break
            }

            newOctopi = flashing.reduce(newOctopi) { newOctopi, flashingOctopus in
                newOctopi.map { octopus in
                    if flashedThisStep.contains(octopus) {
                        return octopus.flash()
                    }

                    return octopus.isNeighbor(of: flashingOctopus)
                        ? octopus.increase()
                        : octopus
                }
            }
        }

        return (newOctopi, flashedThisStep.count)
    }
}

func parseInput(input: String) -> [Octopus] {
    input
        .split(separator: "\n")
        .reversed()
        .enumerated()
        .map { y, row in
            row
                .map { Int(String($0))! }
                .enumerated()
                .map { x, energy in
                    Octopus(x: x, y: y, energy: energy)
                }
        }
        .reduce([], +)
}

public func puzzle1(input: String) -> Int {
    var octopi = parseInput(input: input)
    return (1 ... 100)
        .reduce(into: 0) { sum, step in
            let (newOctopi, flashCount) = octopi.nextStep()
            octopi = newOctopi
            sum += flashCount
            print("Step \(step) - flashed: \(flashCount) - total: \(sum)")
        }
}

public func puzzle2(input: String) -> Int {
    var octopi = parseInput(input: input)
    let octopiCount = octopi.count

    var grids = [octopi]
    var step = 1
    while true {
        let (newOctopi, flashCount) = octopi.nextStep()
        print("Step \(step) - flashed: \(flashCount)")
        if flashCount == octopiCount {
            break
        }

        octopi = newOctopi
        step += 1

        grids.append(newOctopi)
    }
    return step
}

// print("Test puzzle 1: \(puzzle1(input: testInput))\n")
// print("Answer puzzle 1: \(puzzle1(input: input))\n")
////
// print("Test puzzle 2: \(puzzle2(input: testInput))\n")
// print("Answer puzzle 2: \(puzzle2(input: input))\n")
