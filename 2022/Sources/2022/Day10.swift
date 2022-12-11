import Foundation
import Algorithms

struct Day10: Day {
    let signals = Files.input10Txt.read()
        .components(separatedBy: "\n")
        .reduce(into: [1]) { acc, instruction in
            if instruction.contains("noop") {
                acc.append(acc.last!)
            } else {
                acc.append(acc.last!)
                let value = instruction.components(separatedBy: "addx ")[1]
                acc.append(
                    acc.last! + (
                        value.contains("-")
                            ? -Int(value.dropFirst(1))
                            : Int(value)
                    )
                )
            }
        }

    func partOne() -> String {
        zip(signals.indices, signals.suffix(from: 19))
            .striding(by: 40)
            .map {
                ($0 + 20) * $1
            }
            .reduce(0, +)
            .description
    }

    func partTwo() -> String {
        String(
            zip(signals.indices, signals)
                .reduce(into: "") { result, cycle in
                    let pos = cycle.0 % 40
                    if pos == 0 {
                        result.append("\n")
                    }
                    result.append(
                        (cycle.1-1...cycle.1+1).contains(pos)
                        ? "#"
                        : "."
                    )
                }
                .trimmingCharacters(in: .whitespacesAndNewlines)
                .dropLast(2)
        )
    }
}
