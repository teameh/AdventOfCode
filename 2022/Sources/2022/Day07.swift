import Foundation
import Algorithms

struct Day7: Day {
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

    let terminalOutput = Files.input07Txt.read()
        .components(separatedBy: "\n")
        .reversed()
        .map { $0 }

    func partOne() -> String {
        var lines = terminalOutput
        let root = FileSystem.dir(mapDir(lines: &lines))
        return root.dirs
            .map(\.size)
            .filter { $0 <= 100000 }
            .reduce(0, +)
            .description
    }

    func partTwo() -> String {
        var lines = terminalOutput
        let root = FileSystem.dir(mapDir(lines: &lines))
        return root.dirs
            .map(\.size)
            .sorted()
            .first(where: { 70000000 - root.size + $0 >= 30000000 })!
            .description
    }

    func mapDir(lines: inout [String]) -> [FileSystem] {
        var contents: [FileSystem] = []
        while let line = lines.popLast() {
            if line == "$ cd /" || line == "$ ls" || line.starts(with: "dir ") {
                continue
            } else if line.contains("$ cd ") {
                contents.append(FileSystem.dir(mapDir(lines: &lines)))
                continue
            } else if line == "$ cd .." {
                break
            } else {
                contents.append(FileSystem.file(line.components(separatedBy: " ")[0].intValue))
            }
        }
        return contents
    }
}
