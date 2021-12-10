import Foundation

var testInput = "3,4,3,1,2"
var input = "1,4,2,4,5,3,5,2,2,5,2,1,2,4,5,2,3,5,4,3,3,1,2,3,2,1,4,4,2,1,1,4,1,4,4,4,1,4,2,4,3,3,3,3,1,1,5,4,2,5,2,4,2,2,3,1,2,5,2,4,1,5,3,5,1,4,5,3,1,4,5,2,4,5,3,1,2,5,1,2,2,1,5,5,1,1,1,4,2,5,4,3,3,1,3,4,1,1,2,2,2,5,4,4,3,2,1,1,1,1,2,5,1,3,2,1,4,4,2,1,4,5,2,5,5,3,3,1,3,2,2,3,4,1,3,1,5,4,2,5,2,4,1,5,1,4,5,1,2,4,4,1,4,1,4,4,2,2,5,4,1,3,1,3,3,1,5,1,5,5,5,1,3,1,2,1,4,5,4,4,1,3,3,1,4,1,2,1,3,2,1,5,5,3,3,1,3,5,1,5,3,5,3,1,1,1,1,4,4,3,5,5,1,1,2,2,5,5,3,2,5,2,3,4,4,1,1,2,2,4,3,5,5,1,1,5,4,3,1,3,1,2,4,4,4,4,1,4,3,4,1,3,5,5,5,1,3,5,4,3,1,3,5,4,4,3,4,2,1,1,3,1,1,2,4,1,4,1,1,1,5,5,1,3,4,1,1,5,4,4,2,2,1,3,4,4,2,2,2,3"

func parseInput(input: String) -> [Int] {
    input
        .split(separator: ",")
        .map { Int($0)! }
}

func puzzle1(input: String, days: Int) -> Int {
    let fishAges = parseInput(input: input)

    let newFishAges = (1...days)
        .reduce(fishAges) { fish, _ in
            fish
                .map { $0 == 0 ? [6, 8] : [$0 - 1] }
                .reduce([], +)
        }

    return newFishAges.count
}

func puzzle2(input: String, days: Int) -> Int {
    let fishTimers = parseInput(input: input)

    let initialFishTimerCounts = fishTimers
        .reduce(into: [:], { res, fish in
            res[fish] = (res[fish] ?? 0) + 1
        })

    let finalFishTimersCounts = (1...days)
        .reduce(initialFishTimerCounts) { (fishTimerCounts, day) -> [Int: Int] in
            fishTimerCounts.reduce(into: [:]) { fishTimerCountsAfterThisDay, fishTimerCount in
                let (timer, count) = fishTimerCount
                let newCounts = timer == 0 ? [6: count, 8: count] : [timer - 1 : count]
                fishTimerCountsAfterThisDay.merge(newCounts, uniquingKeysWith: +)
            }
        }

    return finalFishTimersCounts.values.reduce(0, +)
}

//print("Test puzzle 1: \(puzzle1(input: testInput, days: 80))")
//print("Test puzzle 2: \(puzzle2(input: testInput, days: 256))")
//print("Answer puzzle 1: \(puzzle1(input: input, days: 80))")
//print("Answer puzzle 2: \(puzzle2(input: input, days: 256))")
