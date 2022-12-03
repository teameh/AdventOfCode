import Foundation

extension File {
    func read() -> String {
        try! String(contentsOfFile: path)
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

