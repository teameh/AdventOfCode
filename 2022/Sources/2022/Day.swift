import Foundation

protocol Day {
    init()

    func partOne() -> String
    func partTwo() -> String
}

extension Day {
    func run() {
        let startTime = Date()

        print("\n------------ \(type(of: self)) ------------")
        print(partOne())
        print(partTwo())

        print(String(format: "Took %0.4f sec", Double(startTime.timeIntervalSinceNow) * -1))
    }
}
