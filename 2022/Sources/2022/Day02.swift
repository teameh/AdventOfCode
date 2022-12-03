import Foundation
import Algorithms

struct Day2: Day {
    let rounds: [String] = Files.input02Txt
        .read()
        .components(separatedBy: "\n")

    func partOne() -> String {
        let scores = [
            "A X": 1 + 3,
            "A Y": 2 + 6,
            "A Z": 3 + 0,
            "B X": 1 + 0,
            "B Y": 2 + 3,
            "B Z": 3 + 6,
            "C X": 1 + 6,
            "C Y": 2 + 0,
            "C Z": 3 + 3,
        ]
        return rounds
            .map { scores[$0]! }
            .reduce(0, +)
            .description
    }

    func partTwo() -> String {
        let scores = [
            "A X": 3 + 0,
            "A Y": 1 + 3,
            "A Z": 2 + 6,
            "B X": 1 + 0,
            "B Y": 2 + 3,
            "B Z": 3 + 6,
            "C X": 2 + 0,
            "C Y": 3 + 3,
            "C Z": 1 + 6,
        ]
        return rounds
            .map { scores[$0]! }
            .reduce(0, +)
            .description
    }
}
