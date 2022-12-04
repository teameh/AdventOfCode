import Foundation

protocol Day {
    init()

    func partOne() -> String
    func partTwo() -> String
}

extension Day {
    func run() -> (String, String) {
        let startTime = Date()

        print("\n------------ \(type(of: self)) ------------")
        let result1 = partOne()
        let result2 = partTwo()
        print(result1)
        print(result2)

        print(String(format: "Took %0.4f sec", Double(startTime.timeIntervalSinceNow) * -1))

        return (result1, result2)
    }
}
