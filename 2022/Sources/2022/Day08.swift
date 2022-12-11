import Foundation
import Algorithms

struct Tree {
    let height: Int
    let treeLines: [[Int]] // lines of trees to the edges (left, right, up, down)
}

struct Day8: Day {
    let trees: [Tree]

    init() {
        let input: [[Int]] = Files.input08Txt
            .read()
            .components(separatedBy: "\n")
            .map { $0.map(Int.init) }

        trees = input
            .enumerated()
            .flatMap { (y, row) -> [Tree] in
                row.enumerated().map { (x, tree) -> Tree in
                    let column = input.map(\.[x])
                    return Tree(
                        height: tree,
                        treeLines: [
                            Array(row[0..<x].reversed()),
                            Array(row[x+1..<row.count]),
                            Array(column[0..<y].reversed()),
                            Array(column[y+1..<column.count])
                        ]
                    )
                }
            }
    }

    func partOne() -> String {
        trees
            .filter { tree -> Bool in
                tree.treeLines.contains { lineOfTrees -> Bool in
                    lineOfTrees.count == 0 || (lineOfTrees.max() ?? 0) < tree.height
                }
            }
            .count
            .description
    }

    func partTwo() -> String {
        trees
            .map { tree -> Int in
                tree.treeLines.map { lineOfTrees -> Int in
                    lineOfTrees
                        .firstIndex(where: { $0 >= tree.height })
                        .map { $0 + 1 } ?? lineOfTrees.count
                }
                .reduce(1, *)
            }
            .max()!
            .description
    }
}
