import Foundation
import Algorithms
import RegexBuilder

struct Day2: Day {
    func partOne() -> String {
        let bagConfiguration = ["red": 12, "green" : 13, "blue" : 14]
        return makeFewestNumberOfCubes()
            .compactMap { (gameId, fewestNumberOfCubes) in
                fewestNumberOfCubes.allSatisfy { bagConfiguration[$0.key]! >= $0.value }
                    ? gameId
                    : nil
            }
            .reduce(0, +)
            .description
    }

    func partTwo() -> String {
        makeFewestNumberOfCubes()
            .map { $1.values.reduce(1, *) }
            .reduce(0, +)
            .description
    }

    func makeFewestNumberOfCubes() -> [(gameId: Int, fewestNumberOfCubes: [String: Int])] {
        let regex = Regex {
          ZeroOrMore(.whitespace)
          Capture { ZeroOrMore(.digit) }
          ZeroOrMore(.whitespace)
          Capture {
            ChoiceOf {
              "blue"
              "green"
              "red"
            }
          }
        }

        return Files.input02Txt
            .read()
            .split(separator: "\n")
            .enumerated()
            .map { index, game -> (gameId: Int, fewestNumberOfCubes: [String: Int]) in
                let fewestNumberOfCubes = game
                    .split(separator: "Game \(index + 1):")[0]
                    .split(separator: ";")
                    .reduce(into: [String: Int](), { partialResult, reveals in
                        reveals
                            .split(separator: ",")
                            .forEach { reveal in
                                reveal
                                    .matches(of: regex)
                                    .forEach { match in
                                        let amount = Int(match.output.1)
                                        let color = String(match.output.2)
                                        partialResult[color] = max(partialResult[color, default: 0], amount)
                                    }
                            }
                    })

                return (gameId: index + 1, fewestNumberOfCubes: fewestNumberOfCubes)
            }
    }
}
