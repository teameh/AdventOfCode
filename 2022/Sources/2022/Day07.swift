import Foundation
import Algorithms

enum FileSystem {
    indirect case dir([FileSystem])
    case file(Int)

    var size: Int {
        switch self {
        case let .file(size):
            return size
        case let .dir(contents):
            return contents
                .map(\.size)
                .reduce(0, +)
        }
    }

    var dirs: [FileSystem] {
        switch self {
        case .file:
            return []
        case let .dir(contents):
            return [self] + contents
                .flatMap { $0.dirs}
        }
    }
}

struct Day7: Day {
    private let fileSystem: FileSystem

    public init() {
        var lines = Files.input07Txt.read()
            .components(separatedBy: "\n")
            .reversed()
            .map { $0 }

        fileSystem = .dir(mapDir(lines: &lines))
    }

    func partOne() -> String {
        fileSystem.dirs
            .map(\.size)
            .filter { $0 <= 100000 }
            .reduce(0, +)
            .description
    }

    func partTwo() -> String {
        fileSystem.dirs
            .map(\.size)
            .sorted()
            .first(where: { 70000000 - fileSystem.size + $0 >= 30000000 })!
            .description
    }
}

private func mapDir(lines: inout [String]) -> [FileSystem] {
    var contents: [FileSystem] = []
    while let line = lines.popLast() {
        if line == "$ cd /" || line == "$ ls" || line.starts(with: "dir ") {
            continue
        } else if line == "$ cd .." {
            break
        } else if line.contains("$ cd ") {
            contents.append(.dir(mapDir(lines: &lines)))
        } else {
            contents.append(.file(line.components(separatedBy: " ")[0].intValue))
        }
    }
    return contents
}
