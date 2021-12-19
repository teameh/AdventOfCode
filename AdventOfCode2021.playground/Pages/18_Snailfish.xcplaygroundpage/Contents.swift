import Foundation
import CoreGraphics

let testInput1 = """
[[[[4,3],4],4],[7,[[8,4],9]]]
[1,1]
"""

let testInput2 = """
[[[0,[4,5]],[0,0]],[[[4,5],[2,6]],[9,5]]]
[7,[[[3,7],[4,3]],[[6,3],[8,8]]]]
[[2,[[0,8],[3,4]]],[[[6,7],1],[7,[1,6]]]]
[[[[2,4],7],[6,[0,5]]],[[[6,8],[2,8]],[[2,1],[4,5]]]]
[7,[5,[[3,8],[1,4]]]]
[[2,[2,2]],[8,[8,1]]]
[2,9]
[1,[[[9,3],9],[[9,0],[0,7]]]]
[[[5,[7,4]],7],1]
[[[[4,2],2],6],[8,7]]
"""

let input = """
[[[[6,3],7],0],[[7,0],0]]
[[[4,7],[6,[6,5]]],[4,[[6,5],[9,1]]]]
[[[[3,7],[6,9]],[3,[4,1]]],8]
[[[0,[2,0]],3],2]
[[[[1,3],4],9],[[[1,8],[9,3]],[0,7]]]
[[[5,9],1],[[[4,8],[4,8]],[[9,7],[3,6]]]]
[[[0,7],4],[[[0,4],2],[4,2]]]
[[5,1],[2,5]]
[[[[4,8],[8,3]],[6,[2,3]]],[[6,0],[1,3]]]
[[[[1,7],[8,1]],[2,[3,4]]],[[7,[8,7]],[[8,6],5]]]
[[9,[[8,9],[0,6]]],[[[8,4],5],[0,[1,7]]]]
[[[[9,8],[6,9]],[[3,5],[6,2]]],[[[7,8],5],8]]
[[[[7,1],8],[0,2]],[3,5]]
[[[1,9],3],[8,[8,[7,8]]]]
[[[9,[8,5]],[1,[9,0]]],5]
[9,[[[1,1],8],[[3,5],9]]]
[[[1,[7,8]],2],[8,0]]
[7,[8,[[6,1],[7,9]]]]
[[7,[[4,7],7]],[[8,[5,2]],2]]
[[[[1,7],[9,0]],3],[8,[4,[2,0]]]]
[[4,3],[[9,[7,7]],7]]
[[[[9,5],3],[[8,5],5]],5]
[[[[4,9],2],[[5,6],[9,0]]],[[2,[2,2]],1]]
[[[[7,9],[6,0]],[1,[5,8]]],[8,8]]
[[[[0,5],2],[4,[5,7]]],[8,[[8,1],[6,7]]]]
[9,[7,[[3,7],[6,4]]]]
[[[[5,3],[5,2]],[[5,0],0]],[[[4,6],[6,4]],[8,8]]]
[1,[[8,0],0]]
[[3,[7,9]],[[[1,2],[1,6]],[[9,2],[2,8]]]]
[[[2,8],[3,[8,3]]],[3,[[9,8],[5,6]]]]
[[[[2,0],3],[5,1]],[[[2,9],7],[[0,4],[1,4]]]]
[[3,[[0,0],[9,0]]],[[6,[0,5]],[[5,4],[5,2]]]]
[[8,[[9,4],[6,8]]],[3,[[8,1],4]]]
[[[[4,1],[5,1]],[4,[9,1]]],4]
[2,[[[0,5],[8,7]],[[6,1],[1,0]]]]
[7,[8,8]]
[[[[7,3],5],9],[[[5,9],[3,5]],[[9,4],8]]]
[[[[4,2],[6,1]],[[6,6],7]],[2,2]]
[[[1,1],4],[[[4,8],0],[[6,7],7]]]
[[[[5,9],[0,1]],[9,7]],2]
[[[[6,4],[5,5]],[[2,8],0]],9]
[[7,[4,9]],[5,[[0,2],2]]]
[[2,[9,9]],[[8,5],8]]
[3,[8,[6,[2,8]]]]
[[[0,1],[[8,5],[8,9]]],0]
[[[[1,8],[1,4]],8],[[6,8],[8,[5,7]]]]
[[[[7,1],[2,0]],[2,4]],[[[3,7],[2,2]],1]]
[[[[0,3],[8,0]],[2,6]],[[6,2],[0,4]]]
[[[7,1],[[6,8],[3,2]]],[[8,[3,2]],[1,[0,1]]]]
[[[8,[5,7]],4],[[1,[1,9]],[[4,9],[4,2]]]]
[[[8,5],3],[[9,8],[[4,4],[7,2]]]]
[[5,[5,[8,7]]],[[8,0],[[6,3],6]]]
[[[8,4],[[5,2],[7,0]]],[[[9,7],[8,9]],7]]
[[5,[3,[3,0]]],5]
[[[[0,1],[0,0]],[4,[3,7]]],[8,0]]
[5,[[[8,3],8],5]]
[[[5,[0,6]],4],[4,[3,[6,3]]]]
[[[[4,1],[3,5]],[[5,0],7]],[[[7,9],[8,8]],[[8,0],[5,8]]]]
[[[7,[6,6]],[[6,2],2]],8]
[1,[4,[[2,9],[3,8]]]]
[[[9,[5,4]],[[2,5],7]],[[4,2],9]]
[[9,1],[[0,7],[[4,1],[5,6]]]]
[[[7,[8,6]],[[4,5],1]],[[[2,1],[6,3]],[4,[0,3]]]]
[[0,[2,[7,5]]],[[[5,0],5],3]]
[[[0,[4,1]],7],[[[3,7],5],[[5,9],7]]]
[[4,[[1,3],1]],[[9,6],[[6,2],3]]]
[3,[[[8,5],6],4]]
[[2,7],[[[3,9],3],[[2,1],2]]]
[[4,[5,[9,9]]],[[[3,0],[4,1]],[[6,4],9]]]
[[[7,9],[[5,7],[2,1]]],[[[1,4],6],[3,3]]]
[[[[4,0],3],[3,[6,3]]],[[[6,2],4],5]]
[[9,[[2,4],3]],[[9,[1,0]],[[5,8],[7,1]]]]
[8,[1,5]]
[[[5,5],3],[[[8,9],3],4]]
[[1,[[8,8],[7,4]]],[[[9,1],[9,6]],[7,8]]]
[[[7,2],[[0,1],5]],7]
[[9,3],[7,[1,[9,2]]]]
[[[[8,2],[8,0]],[[7,1],6]],[0,[[9,4],1]]]
[[[[1,3],2],[6,[0,0]]],[[[7,8],[4,3]],[[9,4],1]]]
[[[[2,1],[7,1]],[[5,4],[9,2]]],[[3,0],0]]
[[[8,6],[[2,1],[9,1]]],[[3,[1,8]],[3,3]]]
[[[[6,2],[3,6]],3],[5,9]]
[[[[7,6],7],[[4,2],1]],[[0,4],[[9,8],6]]]
[[8,[[7,6],[8,5]]],[[2,7],[[7,0],[0,0]]]]
[[[0,[0,0]],4],[[[6,1],8],[[5,9],[6,5]]]]
[[[8,[9,9]],9],[[3,[2,8]],[[9,5],[2,9]]]]
[[[7,5],[[0,7],[3,3]]],[[8,[1,5]],9]]
[[[6,[9,0]],[[0,7],[7,5]]],[[[4,9],0],[[2,3],7]]]
[[8,[8,[0,1]]],[[2,6],7]]
[1,[[9,3],1]]
[[[[6,2],[0,8]],5],[[[9,4],7],[[6,3],6]]]
[[[8,[4,2]],[4,9]],[7,[[9,0],8]]]
[1,[[7,3],2]]
[[[3,[5,9]],[7,[0,4]]],[[[3,0],7],4]]
[[[1,[8,3]],[4,[2,3]]],[[3,[1,6]],[[1,6],5]]]
[[[[1,3],2],9],[5,[4,9]]]
[[[7,[0,6]],2],[[[1,5],[0,7]],[4,9]]]
[[[5,0],[0,[1,1]]],5]
[[[[9,3],[0,0]],[[1,3],[7,3]]],[[5,7],[[6,6],[6,5]]]]
[[[8,0],[9,0]],[[[4,7],4],[5,[2,6]]]]
"""

func parseInput(input: String) -> [[String]] {
    input
        .split(separator: "\n")
        .map { $0.map { String($0) } }
}

typealias Num = [String]

extension Num {
    static func +(lhs: Num, rhs: Num) -> Num {
        var sum = [["["], lhs, [","], rhs, ["]"]].flatMap  { $0 }
        sum.reduce()
        return sum
    }

    mutating func reduce() {
        var depth = 0
        let explodeStart = firstIndex { char in
            switch char {
                case "[":
                    depth += 1
                    return depth == 5
                case "]":
                    depth -= 1
                    return false
                default:
                    return false
            }
        }

        let splitStart = firstIndex { char in
            !["[","]",","].contains(char) && Int(char)! > 9
        }

        if let explodeStart = explodeStart {
            let explodeEnd = suffix(from: explodeStart).firstIndex(where: { $0 == "]" })!
            let exploding = self[explodeStart+1...explodeEnd-1]
            let parts = exploding.split(separator: ",")

            if let leftIntIndex = prefix(upTo: explodeStart).lastIndex(where: { !["[","]",","].contains($0) }) {
                var left = Int(String(self[leftIntIndex]))!
                left += Int(parts.first!.reduce("", +))!
                remove(at: leftIntIndex)
                insert("\(left)", at: leftIntIndex)
            }

            if let rightIntIndex = suffix(from: explodeEnd).firstIndex(where: { !["[","]",","].contains($0) }) {
                var right = Int(String(self[rightIntIndex]))!
                right += Int(parts.last!.reduce("", +))!
                remove(at: rightIntIndex)
                insert("\(right)", at: rightIntIndex)
            }

            removeSubrange(explodeStart...explodeEnd)
            insert("0", at: explodeStart)
            reduce()
        } else if let splitStart = splitStart {
            let splitting = Float(self[splitStart])! / 2
            let newPair = ["[", "\(Int(splitting.rounded(.towardZero)))", ",", "\(Int(splitting.rounded(.awayFromZero)))", "]"]
            remove(at: splitStart)
            insert(contentsOf: newPair, at: splitStart)
            print(joined())
            reduce()
        }
    }

    func toNumber() -> Number {
        Number(string: joined().map { String($0) })
    }
}

indirect enum Number: CustomStringConvertible {
    case one(Int)
    case two(Number, Number)

    var description: String {
        switch self {
        case .one(let val):
            return "\(val)"
        case .two(let lhs, let rhs):
            return "[\(lhs),\(rhs)]"
        }
    }

    init(string: [String]) {
        var rawValue = string
        if rawValue.first == "[" || rawValue.last == "]" {
            rawValue.removeFirst()
            rawValue.removeLast()
            var depth = 0
            let splitIndex = rawValue.firstIndex { char in
                switch char {
                    case "[":
                        depth += 1
                        return false
                    case "]":
                        depth -= 1
                        return false
                    case "," where depth == 0:
                        return true
                    default:
                        return false
                }
            }!
            self = .two(
                Number(string: Array(rawValue.prefix(upTo: Int(splitIndex)))),
                Number(string: Array(rawValue.suffix(from: Int(splitIndex + 1))))
            )
        } else {
            self = .one(Int(string.reduce("", +))!)
        }
    }

    func magnitude() -> Int {
        switch self {
        case .one(let val):
            return val
        case .two(let lhs, let rhs):
            return 3*lhs.magnitude() + 2*rhs.magnitude()
        }
    }
}

var numbers = parseInput(input: input)
let firstNumber = numbers.removeFirst()
var part1 = numbers.reduce(firstNumber, +).toNumber().magnitude()
print("Puzzle1:", part1)

let part2 = numbers
    .map { number in
        max(
            numbers.map { (number + $0).toNumber().magnitude() }.reduce(0, max),
            numbers.map { ($0 + number).toNumber().magnitude() }.reduce(0, max)
        )
    }
    .reduce(0, max)

print("Puzzle2:", part2)
