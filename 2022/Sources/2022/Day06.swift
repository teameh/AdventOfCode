import Algorithms
import Foundation

struct Day6: Day {
    func findUniqueSequence(length: Int, name: String) -> String {
        var buffer: [Character] = []
        for (index, char) in Files.input06Txt.read().enumerated() {
            buffer = (buffer + [char]).suffix(length)
            if Set(buffer).count == length {
                return (index + 1).description
            }
        }
        fatalError("No \(name) found")
    }

    func partOne() -> String {
        findUniqueSequence(length: 4, name: "start-of-packet")
    }

    func partTwo() -> String {
        findUniqueSequence(length: 14, name: "start-of-message")
    }
}
