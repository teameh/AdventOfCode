import Foundation
import Algorithms

struct Day4: Day {
    let pairs: [[ClosedRange<Int>]] =  Files.input04Txt
        .read()
        .components(separatedBy: "\n")
        .map {
            $0
                .split(separator: ",")
                .map { $0.split(separator: "-") }
                .map { $0.first!.intValue...$0.last!.intValue }
        }

    func partOne() -> String {
        pairs.filter { pairs in
            pairs.first!.clamped(to: pairs.last!) == pairs.first
                || pairs.last!.clamped(to: pairs.first!) == pairs.last
        }
        .count
        .description
    }

    func partTwo() -> String {
        pairs.filter { pairs in
            pairs.first!.overlaps(pairs.last!)
        }
        .count
        .description
    }
}
