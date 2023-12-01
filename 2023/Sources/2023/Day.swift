import Foundation

protocol Day {
    init()

    func partOne() -> String
    func partTwo() -> String
}

extension Day {
    static func run() -> (String, String) {
        let startTime = Date()

        print("\n------------ \(type(of: self)) ------------")
        let day = Self()
        let result1 = day.partOne()
        let result2 = day.partTwo()
        print(result1)
        print(result2)

        print(String(format: "Took %0.4f sec", Double(startTime.timeIntervalSinceNow) * -1))

        return (result1, result2)
    }
}
