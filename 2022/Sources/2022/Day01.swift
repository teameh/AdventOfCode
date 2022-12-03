import Foundation
import Algorithms

struct Day1: Day {
    let snacks: [[Int]] = Files.input01Txt
        .read()
        .components(separatedBy: "\n\n")
        .map {
            $0
                .split(separator: "\n")
                .map { Int($0, radix: 10)! }
        }

    func partOne() -> String {
        snacks
            .reduce(0) { acc, snacks in
                max(acc, snacks.reduce(0, +))
            }
            .description
    }

    func partTwo() -> String {
        snacks.enumerated()
            .map { ($0, $1.reduce(0, +)) }
            .sorted { $0.1 < $1.1 }
            .suffix(3)
            .map { $0.1 }
            .reduce(0, +)
            .description
    }
}
