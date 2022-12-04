import Foundation
import Algorithms

struct Day3: Day {
    let rucksacks: [[Character]] =  Files.input03Txt
        .read()
        .components(separatedBy: "\n")
        .map { $0.map { $0 } }

    func partOne() -> String {
        rucksacks
            .compactMap { rucksack -> Int? in
                let parts = rucksack.chunks(ofCount: rucksack.count / 2)
                return parts.first!.first { parts.last!.contains($0) }?.priority
            }
            .reduce(0, +)
            .description
    }

    func partTwo() -> String {
        rucksacks
            .chunks(ofCount: 3)
            .map(Array.init)
            .compactMap { group -> Int? in
                group[0].first { group[1].contains($0) && group[2].contains($0) }?.priority
            }
            .reduce(0, +)
            .description
    }
}

fileprivate extension Character {
    var priority: Int {
        intValue - (
            CharacterSet.lowercaseLetters.contains(unicodeScalars.first!)
                ? Character("a").intValue - 1
                : Character("A").intValue - 27
        )
    }
}
