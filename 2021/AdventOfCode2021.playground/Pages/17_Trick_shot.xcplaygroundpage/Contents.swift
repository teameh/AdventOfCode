import Foundation
import CoreGraphics

let testTarget = CGRect(x: 20, y: -10, width: 30-20, height: 5-10)
let realTarget = CGRect(x: 153, y: -114, width: 199-152, height: 114-74)

struct Probe {
    var position = CGPoint(x: 0, y: 0)
    var velocity: CGPoint

    var highestPoint: CGFloat = 0
    var initialVelocity: CGPoint

    init(velocity: CGPoint) {
        self.velocity = velocity
        self.initialVelocity = velocity
    }

    mutating func step() {
        position = CGPoint(x: position.x + velocity.x, y: position.y + velocity.y)
        highestPoint = max(highestPoint, position.y)
        velocity = CGPoint(
            x: velocity.x == 0 ? 0 : velocity.x < 0 ? velocity.x + 1 : velocity.x - 1,
            y: velocity.y - 1
        )
    }

    var description: String {
        "\(initialVelocity) \(position) \(velocity) \(highestPoint)"
    }
}

func getSuccesfulProbes(target: CGRect) -> [Probe] {
    (0...500)
        .flatMap { x in
            (-500...500).map { y in
                Probe(velocity: CGPoint(x: x, y: y))
            }
        }
        .reduce(into: []) { succesProbes, probe in
            var probe = probe
            while true {
                probe.step()

                if realTarget.contains(probe.position) {
                    succesProbes.append(probe)
                    break
                }

                if probe.position.x > target.maxX || probe.position.y < target.minY {
                    break
                }
            }
        }
        .sorted { $0.highestPoint > $1.highestPoint }
}

let succesProbes = getSuccesfulProbes(target: realTarget)
print("Highest point", Int(succesProbes.first!.highestPoint))
print("Distinct initial velocity values that hit", succesProbes.count)
