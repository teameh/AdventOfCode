import Foundation

func runAllDays() {
    let startTime = Date()

    let days: [(Day.Type, String, String)] = [
        (Day1.self, "68802", "205370"),
        (Day2.self, "13221", "13131"),
        (Day3.self, "7795", "2703"),
        (Day4.self, "494", "833"),
        (Day5.self, "BSDMQFLSP", "PGSQBFLDP"),
        (Day6.self, "1282", "3513"),
        (Day7.self, "1243729", "4443914"),
        (Day8.self, "1801", "209880"),
        (Day9.self, "5878", "2405"),
        (
            Day10.self,
            "12520",
"""
####.#..#.###..####.###....##..##..#....
#....#..#.#..#....#.#..#....#.#..#.#....
###..####.#..#...#..#..#....#.#....#....
#....#..#.###...#...###.....#.#.##.#....
#....#..#.#....#....#....#..#.#..#.#....
####.#..#.#....####.#.....##...###.####.
"""
        ),
    ]

    days.forEach { day, resultOne, resultTwo in
        let result = day.run()
        assert(result.0 == resultOne, "\(result.0) != \(resultOne)")
        assert(result.1 == resultTwo, "\(result.1) != \(resultTwo)")
    }

    print(String(format: "\n⏱ Total time for \(days.count) days: %0.4f sec", Double(startTime.timeIntervalSinceNow) * -1))
}

runAllDays()
