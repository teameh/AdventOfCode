import Foundation
import Algorithms

struct Day3: Day {
    let lines = Files.input03Txt
        .read()
        .split(separator: "\n")
        .map(String.init)

    func partOne() -> String {
        let integerMatches = lines.matches(of: #/\d+/#)
        let symbolMatches = lines.matches(of: #/(?!\.)\D/#)

        return integerMatches
            .enumerated()
            .flatMap { (lineIndex, matches) in
                matches.compactMap { range, partNumber in
                    let extendedRange = range.extendedBounds(in: lines[lineIndex])
                    let isNextToSymbol = [
                        symbolMatches[safe: lineIndex - 1],
                        symbolMatches[lineIndex],
                        symbolMatches[safe: lineIndex + 1]
                    ]
                        .compacted()
                        .flatMap { $0 }
                        .contains { (range: Range<String.Index>, _) in
                            range.overlaps(extendedRange)
                        }

                    return isNextToSymbol 
                        ? Int(partNumber)
                        : nil
                }
            }
            .reduce(0, +)
            .description
    }

    func partTwo() -> String {
        let integerMatches = lines.matches(of: #/\d+/#)
        let gearSymbolMatches = lines.matches(of: #/(?!\.)\*/#)

        return gearSymbolMatches
            .enumerated()
            .flatMap { (lineIndex, matches) in
                matches.compactMap { (range, _) in
                    let extendedRange = range.extendedBounds(in: lines[lineIndex])
                    let partNumbers = [
                        integerMatches[safe: lineIndex - 1],
                        integerMatches[lineIndex],
                        integerMatches[safe: lineIndex + 1],
                    ]
                        .compacted()
                        .flatMap { $0 }
                        .compactMap { (range: Range<String.Index>, partNumber: Substring) in
                            range.overlaps(extendedRange) ? Int(partNumber) : nil
                        }

                    return partNumbers.count == 2
                        ? partNumbers.reduce(1, *)
                        : nil
                }
            }
            .reduce(0, +)
            .description
    }
}

fileprivate extension Array where Element == String {
    func matches(of regex: Regex<Substring>) -> [[(range: Range<String.Index>, value: Substring)]] {
        map { line in
            line
                .matches(of: regex)
                .map { match in
                    (range: match.range, value: line[match.range])
                }
        }
    }
}

fileprivate extension Range where Bound == String.Index {
    func extendedBounds(in string: String) -> Self {
        Range(
            uncheckedBounds: (
                lower: string.startIndex == lowerBound ? lowerBound : string.index(before: lowerBound),
                upper: string.endIndex == upperBound ? upperBound : string.index(after: upperBound)
            )
        )
    }
}
