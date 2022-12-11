import Algorithms
import Foundation

struct Day5: Day {
    func makeStacksAndInstructions() -> (stacks: [[Character]], instructions: [(Int, Int, Int)]) {
        let lines = Files.input05Txt
            .read(trimmingCharacters: nil)
            .components(separatedBy: "\n")

        let stacks = lines
            .filter { $0.contains("[") }
            .map { line -> [Character?] in
                line
                    .chunks(ofCount: 4)
                    .map { chunk in
                        chunk.first { CharacterSet.letters.contains($0.unicodeScalars.first!) }
                    }
            }
            .reduce(into: [[Character?]](), { acc, line in
                for (index, crate) in line.enumerated() {
                    acc[safe: index] != nil
                        ? acc[index].append(crate)
                        : acc.append([crate])
                }
            })
            .map { Array($0.reversed().compacted()) }

        let instructions: [(Int, Int, Int)] = lines
            .filter { $0.contains("move") }
            .map { $0.components(separatedBy: " ") }
            .map { (Int($0[1]), Int($0[3]), Int($0[5])) }

        return (stacks, instructions)
    }

    func partOne() -> String {
        let (stacks, instructions) = makeStacksAndInstructions()
        return String(
            instructions
                .reduce(into: stacks) { stacks, instruction in
                    let (amount, from, to) = instruction
                    for _ in Array(repeating: (), count: amount) {
                        let moved = stacks[from - 1].popLast()!
                        stacks[to - 1].append(moved)
                    }
                }
                .compactMap(\.last)
        )
    }

    func partTwo() -> String {
        let (stacks, instructions) = makeStacksAndInstructions()
        return String(
            instructions
                .reduce(into: stacks) { stacks, instruction in
                    let (amount, from, to) = instruction
                    let movingCrates = stacks[from - 1].suffix(amount)
                    stacks[to - 1].append(contentsOf: movingCrates)
                    stacks[from - 1] = Array(stacks[from - 1].prefix(upTo: stacks[from - 1].count - amount))
                }
                .compactMap(\.last)
        )
    }
}
