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

extension Int {
    init(_ char: Character) {
        self = Int(String(char), radix: 10)!
    }

    init(_ text: Substring.SubSequence) {
        self = Int(text, radix: 10)!
    }

    init(_ text: String) {
        self = Int(text, radix: 10)!
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
