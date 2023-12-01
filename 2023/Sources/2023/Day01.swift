import Foundation
import Algorithms

struct Day1: Day {
    func partOne() -> String {
        Files.input01Txt
            .read()
            .split(separator: "\n")
            .map { line -> Int in
                let stringValue = String(line)
                let firstNumber = stringValue.first(where: { $0.isNumber })
                let lastNumber = stringValue.last(where: { $0.isNumber })
                return Int("\(firstNumber!)\(lastNumber!)")
            }
            .reduce(0, +)
            .description
    }

    func partTwo() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut

        let digits: [String] = (1...9).map(NSNumber.init).compactMap(formatter.string) + (1...9).map { "\($0)" }

        return Files.input01Txt
            .read()
            .split(separator: "\n")
            .map { line -> Int in
                let stringValue = String(line)
                return Int(
                    digits
                        .flatMap { digit -> [(digit: String, range: Range<String.Index>)] in
                            stringValue.ranges(of: digit).map { (digit, $0) }
                        }
                        .minAndMax { $0.range.lowerBound < $1.range.lowerBound }
                        .map { [$0.digit, $1.digit] }!
                        .map { digit in
                            digit.count == 1 && digit[0].isNumber
                                ? digit
                                : "\(formatter.number(from: digit)!)"
                        }
                        .joined()
                )
            }
            .reduce(0, +)
            .description
    }
}
