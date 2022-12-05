import Foundation

extension File {
    func read(trimmingCharacters: CharacterSet? = .whitespacesAndNewlines) -> String {
        let content = try! String(contentsOfFile: path)
        guard let trimmingCharacters = trimmingCharacters else {
            return content
        }
        return content.trimmingCharacters(in: trimmingCharacters)
    }
}

extension Substring.SubSequence {
    var intValue: Int {
        Int(self, radix: 10)!
    }
}

extension String {
    var intValue: Int {
        Int(self, radix: 10)!
    }
}

extension Character {
    var intValue: Int {
        Int(utf8.first!)
    }
}

extension Collection {
    public subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
