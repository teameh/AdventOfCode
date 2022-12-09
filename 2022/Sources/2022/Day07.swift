import Foundation
import Algorithms

private struct FileSystem {
    var size: Int
    var dirs: [FileSystem]
}

struct Day7: Day {
    private let fileSystem: FileSystem

    public init() {
        var lines = Files.input07Txt.read()
            .components(separatedBy: "\n")
            .reversed()
            .map { $0 }

        fileSystem = mapDir(lines: &lines)
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

fileprivate func mapDir(lines: inout [String]) -> FileSystem {
    var size = 0
    var subdirs: [FileSystem] = []
    while let line = lines.popLast() {
        if line == "$ cd /" || line == "$ ls" || line.starts(with: "dir ") {
            continue
        } else if line == "$ cd .." {
            break
        } else if line.contains("$ cd ") {
            subdirs.append(mapDir(lines: &lines))
        } else {
            size += line.components(separatedBy: " ")[0].intValue
        }
    }

    size += subdirs.map(\.size).reduce(0, +)
    let dir = FileSystem(size: size, dirs: subdirs)
    return FileSystem(size: size, dirs: [dir] + subdirs.flatMap { $0.dirs })
}
