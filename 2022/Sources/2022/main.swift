import Foundation

func runAllDays() {
    let startTime = Date()

    let days: [(Day, String, String)] = [
        (Day1(), "68802", "205370"),
        (Day2(), "13221", "13131"),
        (Day3(), "7795", "2703"),
        (Day4(), "494", "833"),
        (Day5(), "BSDMQFLSP", "PGSQBFLDP"),
        (Day6(), "1282", "3513"),
    ]

    days.forEach { day, resultOne, resultTwo in
        let result = day.run()
        assert(result.0 == resultOne, "\(result.0) != \(resultOne)")
        assert(result.1 == resultTwo, "\(result.1) != \(resultTwo)")
    }

    print(String(format: "\n⏱  Total time: %0.4f sec", Double(startTime.timeIntervalSinceNow) * -1))
}

runAllDays()
