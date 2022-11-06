import Foundation

let startTime = Date()

let input = """
xz-end
CJ-pt
pt-QW
hn-SP
pw-CJ
SP-end
hn-pt
GK-nj
fe-nj
CJ-nj
hn-ZZ
hn-start
hn-fe
ZZ-fe
SP-nj
SP-xz
ZZ-pt
nj-ZZ
start-ZZ
hn-GK
CJ-end
start-fe
CJ-xz
"""

let testInput = """
start-A
start-b
A-c
A-b
b-d
A-end
b-end
"""

let slightlyLargerExample = """
dc-end
HN-start
start-kj
dc-start
dc-HN
LN-dc
HN-end
kj-sa
kj-HN
kj-dc
"""

func parseInput(_ input: String) -> [(String, String)] {
    return input
        .split(separator: "\n")
        .map {
            let names = $0.split(separator: "-").map { String($0) }
            return [(names.first!, names.last!), (names.last!, names.first!)]
        }
        .reduce([], +)
}

func traverse(links: [(String, String)], path: [String], isPartTwo: Bool = false) -> [[String]] {
    links
        .filter { $0.0 == path.last! }
        .map(\.1)
        .reduce(into: []) { (paths, linkedCave) in
            if linkedCave == "start" {
                return
            }

            if linkedCave == "end" {
                paths.append(path + [linkedCave])
                return
            }

            if linkedCave.lowercased() != linkedCave || !path.contains(linkedCave) {
                // big cave or unvisited small cave
                paths.append(
                    contentsOf: traverse(links: links, path: path + [linkedCave], isPartTwo: isPartTwo)
                )
                return
            }

            if isPartTwo {
                let smallCaves = path.filter { $0.lowercased() == $0 }
                if smallCaves.count - Set(smallCaves).count == 0 {
                    // single small cave we visited only once
                    paths.append(
                        contentsOf: traverse(links: links, path: path + [linkedCave], isPartTwo: isPartTwo)
                    )
                }
            }
        }
}

//var pathsTestInput1 = traverse(links: parseInput(testInput), path: ["start"])
//print("Test part1: \(pathsTestInput1.count)")
//var pathsTestInput2 = traverse(links: parseInput(testInput), path: ["start"], isPartTwo: true)
//print("Test part2: \(pathsTestInput2.count)")
//
//var pathsLargerExample1 = traverse(links: parseInput(slightlyLargerExample), path: ["start"])
//print("Test larger example part1: \(pathsLargerExample1.count)")
//var pathsLargerExample2 = traverse(links: parseInput(slightlyLargerExample), path: ["start"], isPartTwo: true)
//print("Test larger example part2: \(pathsLargerExample2.count)")
//
//var pathsPuzzle1 = traverse(links: parseInput(input), path: ["start"])
//print("Puzzle part1: \(pathsPuzzle1.count)")
//var pathsPuzzle2 = traverse(links: parseInput(input), path: ["start"], isPartTwo: true)
//print("Puzzle part2: \(pathsPuzzle2.count)")
//
//print(String(format: "Took %0.3f sec", Double(startTime.timeIntervalSinceNow) * -1))
