import Foundation

func runAllDays() {
    let startTime = Date()

    let days: [Day] = [
        Day1(),
        Day2(),
        Day3(),
        Day4(),
    ]

    days.forEach { $0.run() }

    print(String(format: "\n⏱  Total time: %0.4f sec", Double(startTime.timeIntervalSinceNow) * -1))
}

runAllDays()
