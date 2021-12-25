import Foundation

func monad(modelNumber: [Int]) -> Int {
    let variant1 = { z, w, a -> Int in
        z * 26 + w + a
    }

    let variant2 = { z, w, a, b -> Int in
        z % 26 == w + a
            ? z / 26
            : z / 26 * 26 + w + b
    }

    var z = 0
    z = variant1(z, modelNumber[0], 3)
    z = variant1(z, modelNumber[1], 7)
    z = variant1(z, modelNumber[2], 1)
    z = variant2(z, modelNumber[3], 4, 6)
    z = variant1(z, modelNumber[4], 14)
    z = variant1(z, modelNumber[5], 7)
    z = variant2(z, modelNumber[6], 4, 9)
    z = variant2(z, modelNumber[7], 12, 9)
    z = variant1(z, modelNumber[8], 6)
    z = variant2(z, modelNumber[9], 11, 4)
    z = variant1(z, modelNumber[10], 0)
    z = variant2(z, modelNumber[11], 1, 7)
    z = variant2(z, modelNumber[12], 0, 12)
    z = variant2(z, modelNumber[13], 11, 1)
    return z
}

func findValidNumber(findHighest: Bool) -> String {
    var modelNumbers = (0...100).map { _  -> String in
        while true {
            let res = String(Int.random(in: 10000000000000...99999999999999))
            if !res.contains("0") {
                return res
            }
        }
    }
    
    var resultsPrev: ArraySlice<(String, Int)> = []
    var generateAmount = 50

    while true {
        let results = modelNumbers
            .map { number -> (String, Int) in
                let z = monad(modelNumber: number.map { Int(String($0))! })
                return (number, z)
            }
            .sorted {
                if $0.1 == $1.1 && $0.1 == 0 {
                    return findHighest
                        ? Int($0.0)! < Int($1.0)!
                        : Int($0.0)! > Int($1.0)!
                } else {
                    return $0.1 > $1.1
                }
            }
            .suffix(100)

        let zeroResults = results
            .filter { $0.1 == 0 }
            .map(\.0)

        print("Best results:", results.suffix(5), " - zeros:", zeroResults.count)

        if resultsPrev.map(\.0) == results.map(\.0) {
            if generateAmount == 500 {
                print("Already increased twice, done!")
                return results.last!.0
            }
            print("results are the same as prev iteration, increase number generation")
            generateAmount = generateAmount * 10
        }
        resultsPrev = results

        modelNumbers = zeroResults + results
            .map(\.0)
            .map { number in
                (0...generateAmount).map { _ -> String in
                    var newNumber = number
                    (0...Int.random(in: 1...7)).forEach { _ in
                        let position = Int.random(in: 0...13)
                        let start = number.index(number.startIndex, offsetBy: position)
                        let end = number.index(number.startIndex, offsetBy: position + 1)
                        newNumber.replaceSubrange(start..<end, with: "\(Int.random(in: 1...9))")
                    }
                    return newNumber
                }
            }
            .reduce([], +)

        modelNumbers = Array(Set(modelNumbers)) // dedupe
    }
}

let highest = findValidNumber(findHighest: true)
print("-------------------------")
print("Highest", highest)

let lowest = findValidNumber(findHighest: false)
print("-------------------------")
print("Lowest", lowest)
