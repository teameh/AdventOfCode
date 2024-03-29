import Foundation

func runAllDays() {
    let startTime = Date()

    let days: [(Day.Type, String, String)] = [
        (Day1.self, "55607", "55291"),
        (Day2.self, "2283", "78669"),
        (Day3.self, "535351", "87287096"),
        (Day4.self, "18653", "5921508"),
        (Day5.self, "", ""),
        (Day6.self, "", ""),
        (Day7.self, "", ""),
        (Day8.self, "", ""),
        (Day9.self, "", ""),
        (Day10.self, "", "")
    ]

    days.forEach { day, resultOne, resultTwo in
        let result = day.run()

        assert(result.0 == resultOne, "\(result.0) != \(resultOne)")
        assert(result.1 == resultTwo, "\(result.1) != \(resultTwo)")
    }

    print(String(format: "\n⏱ Total time for \(days.count) days: %0.4f sec", Double(startTime.timeIntervalSinceNow) * -1))
}

runAllDays()
