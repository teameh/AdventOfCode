import Foundation

let testInput = """
NNCB

CH -> B
HH -> N
CB -> H
NH -> C
HB -> C
HC -> B
HN -> C
NN -> C
BH -> H
NC -> B
NB -> B
BN -> B
BB -> N
BC -> B
CC -> N
CN -> C
"""

let input = """
SHPPPVOFPBFCHHBKBNCV

HK -> C
SP -> H
VH -> K
KS -> B
BC -> S
PS -> K
PN -> S
NC -> F
CV -> B
SH -> K
SK -> H
KK -> O
HO -> V
HP -> C
HB -> S
NB -> N
HC -> K
SB -> O
SN -> C
BP -> H
FC -> V
CF -> C
FB -> F
VP -> S
PO -> N
HN -> N
BS -> O
NF -> H
BH -> O
NK -> B
KC -> B
OS -> S
BB -> S
SV -> K
CH -> B
OB -> K
FV -> B
CP -> V
FP -> C
VC -> K
FS -> S
SS -> F
VK -> C
SF -> B
VS -> B
CC -> P
SC -> S
HS -> K
CN -> C
BN -> N
BK -> B
FN -> H
OK -> S
FO -> S
VB -> C
FH -> S
KN -> K
CK -> B
KV -> P
NP -> P
CB -> N
KB -> C
FK -> K
BO -> O
OV -> B
OC -> B
NO -> F
VF -> V
VO -> B
FF -> K
PP -> O
VV -> K
PC -> N
OF -> S
PV -> P
PB -> C
KO -> V
BF -> N
OO -> K
NV -> P
PK -> V
BV -> C
HH -> K
PH -> S
OH -> B
HF -> S
NH -> H
NN -> K
KF -> H
ON -> N
PF -> H
CS -> H
CO -> O
SO -> K
HV -> N
NS -> N
KP -> S
OP -> N
KH -> P
VN -> H
"""

let inputParts = input.components(separatedBy: "\n\n")
let template = inputParts[0]
let pairs: [String:String] = inputParts[1]
    .split(separator: "\n")
    .reduce(into: [:]) { acc, line in
        let parts = line.components(separatedBy: " -> ")
        acc[parts[0]] = parts[1]
    }
var elements = Set(
    pairs.keys
        .map { [String($0.first!), String($0.last!)] }
        .reduce([], +)
)

let polymerPuzzle1 = (1...10).reduce(template) { polymer, step in
    zip(polymer, polymer.dropFirst())
        .reduce(into: String(polymer.first!)) { result, letters in
            let pair = String(letters.0) + String(letters.1)
            if let insertion = pairs[pair] {
                result += "\(insertion)\(letters.1)"
            } else {
                result += "\(letters.1)"
            }
        }
}

var elementCountsPuzzle1 = elements
    .map { polymerPuzzle1.components(separatedBy: $0).count }
    .sorted()

print("Puzzle 1: \(elementCountsPuzzle1.last! - elementCountsPuzzle1.first!)")

let newPairsLookupTable = Dictionary(
    uniqueKeysWithValues: pairs.map { (key: String, value: String) in
        (key, [String(key.first!) + value, value + String(key.last!)])
    }
)

var initialPairCounts: [String: Int] = zip(template, template.dropFirst())
    .reduce(into: pairs.mapValues { _ in 0 }) { result, letters in
        result[String(letters.0) + String(letters.1)]! += 1
    }

var elementCountsPuzzle2 = (1...40)
    // Calculate pairs
    .reduce(initialPairCounts) { counts, step in
        counts
            .compactMap { (pair, count) in
                Dictionary(uniqueKeysWithValues: newPairsLookupTable[pair]!.map { ($0, count) })
            }
            .reduce([:]) {
                $0.merging($1, uniquingKeysWith: +)
            }
    }
    // Split into elements
    .map {
        $0.key.first == $0.key.last
            ? [String($0.key.first!): $0.value * 2]
            : [String($0.key.first!): $0.value * 2]
    }
    // Merge equal elements
    .reduce([
        // Add extra start and finish element
        String(template.first!): 1,
        String(template.last!): 1
    ]) {
        $0.merging($1, uniquingKeysWith: +)
    }
    // Elements in pairs are counted double
    .mapValues { $0 / 2 }
    .values
    .sorted()

print("Puzzle 2: \(elementCountsPuzzle2.last! - elementCountsPuzzle2.first!)")
