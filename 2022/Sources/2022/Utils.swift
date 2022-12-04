import Foundation

extension File {
    func read() -> String {
        try! String(contentsOfFile: path)
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

extension Substring.SubSequence {
    var intValue: Int {
        Int(self, radix: 10)!
    }
}

extension Character {
    var intValue: Int {
        Int(utf8.first!)
    }
}
