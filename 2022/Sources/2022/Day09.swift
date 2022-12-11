import Foundation
import Algorithms

enum Direction: Substring {
    case left = "L"
    case right = "R"
    case up = "U"
    case down = "D"
}

struct Motion {
    let direction: Direction
    let amount: Int
}

struct Position: Hashable {
    var x: Int
    var y: Int

    mutating func move(_ direction: Direction) {
        switch direction {
        case .left:  x -= 1
        case .right: x += 1
        case .up:    y -= 1
        case .down:  y += 1
        }
    }

    mutating func move(towards other: Position) {
        let xdiff = other.x - x
        let ydiff = other.y - y

        if abs(xdiff) < 2, abs(ydiff) < 2, abs(xdiff) - abs(ydiff) < 2 {
            return
        }

        if xdiff > 0 {
            move(.right)
        } else if xdiff < 0 {
            move(.left)
        }

        if ydiff > 0 {
            move(.down)
        } else if ydiff < 0 {
            move(.up)
        }
    }
}

struct Rope {
    var knots: [Position]
    var positions: [Position] = []

    mutating func move(_ direction: Direction) {
        for index in knots.indices {
            if let prev = knots[safe: index - 1] {
                knots[index].move(towards: prev)
            } else {
                knots[index].move(direction)
            }
        }
    }

    mutating func move(_ motion: Motion) {
        for _ in (1...motion.amount) {
            move(motion.direction)
            positions.append(knots.last!)
        }
    }

    mutating func move(motions: [Motion]) {
        motions.forEach { self.move($0) }
    }
}

struct Day9: Day {
    let motions: [Motion] = Files.input09Txt
        .read()
        .components(separatedBy: "\n")
        .map {
            let parts = $0.split(separator: " ")
            return Motion(
                direction: Direction(rawValue: parts[0])!,
                amount: Int(parts[1])
            )
        }

    func partOne() -> String {
        var rope = Rope(knots: Array(repeating: Position(x: 0, y: 0), count: 2))
        rope.move(motions: motions)
        return Set(rope.positions)
            .count
            .description
    }

    func partTwo() -> String {
        var rope = Rope(knots: Array(repeating: Position(x: 0, y: 0), count: 10))
        rope.move(motions: motions)
        return Set(rope.positions)
            .count
            .description
    }
}
