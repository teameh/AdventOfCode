import Foundation
import Algorithms

struct Day4: Day {
    let lines = Files.input04Txt
        .read()
        .split(separator: "\n")

    func partOne() -> String {
        lines
            .map { card in
                let (winningNumbers, numbers) = parse(card: card)
                return numbers
                    .filter { winningNumbers.contains($0) }
                    .reduce(1) { acc, _ in acc * 2 } / 2
            }
            .reduce(0, +)
            .description
    }

    func partTwo() -> String {
        lines
            .reversed()
            .reduce(into: [Int]()) { (copiesWonForEachCard: inout [Int], card) in
                let cardIndex = copiesWonForEachCard.count
                let (winningNumbers, numbers) = parse(card: card)
                let result = numbers
                    .filter { winningNumbers.contains($0) }
                    .enumerated()
                    .reduce(into: 0) { (acc: inout Int, iteration: (Int, Int)) in
                        acc += copiesWonForEachCard[cardIndex - (iteration.0 + 1)]
                    }

                copiesWonForEachCard.append(1 + result)
            }
            .reduce(0, +)
            .description
    }

    func parse(card: Substring) -> (winningNumbers: [Int], numbers: [Int]) {
        let parts = card.split(separator: #/[:|]/#)
        let winningNumbers = parts[1]
            .matches(of: #/\d+/#)
            .map { Int(card[$0.range]) }

        let numbers = parts[2]
            .matches(of: #/\d+/#)
            .map { Int(card[$0.range]) }

        return (winningNumbers, numbers)
    }
}
