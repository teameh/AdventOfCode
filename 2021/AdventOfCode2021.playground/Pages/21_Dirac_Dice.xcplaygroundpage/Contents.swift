import Foundation

func move(position: Int, distance: Int) -> Int {
    ((position + distance) - 1) % 10 + 1
}

class Part1 {
    var die = 0

    var pos1: Int
    var pos2: Int

    var score1 = 0
    var score2 = 0

    init (player1Start: Int, player2Start: Int) {
        self.pos1 = player1Start
        self.pos2 = player2Start
    }

    func rollDie() -> Int {
        die += 1
        return (die - 1) % 100 + 1
    }

    func play() -> Int {
        while true {
            var scores = [rollDie(), rollDie(), rollDie()]
            pos1 = move(position: pos1, distance: scores.reduce(0, +))
            score1 = score1 + pos1

            if score1 >= 1000 {
                break
            }

            scores = [rollDie(), rollDie(), rollDie()]
            pos2 = move(position: pos2, distance: scores.reduce(0, +))
            score2 = score2 + pos2

            if score2 >= 1000 {
                break
            }
        }
        return min(score1, score2) * die
    }
}

// Part2

struct Player: Hashable {
    let position: Int
    let score: Int
    let isPlaying: Bool

    var won: Bool {
        score >= 21
    }

    func toggleIsPlaying() -> Player {
        Player(position: position, score: score, isPlaying: !isPlaying)
    }
}

struct Part2GameState: Hashable {
    let p1: Player
    let p2: Player
}

let rolls = (1...3)
    .flatMap { r1 in (1...3).flatMap { r2 in (1...3).map { r3 in r1 + r2 + r3 } } }
    .reduce(into: [:], { totals, outcome in
        totals[outcome] = (totals[outcome] ?? 0) + 1
    })

func part2(start1: Int, start2: Int) -> Int {
    let startState = Part2GameState(
        p1: Player(position: start1, score: 0, isPlaying: true),
        p2: Player(position: start2, score: 0, isPlaying: false)
    )
    var gameStates = [startState: 1]

    while true {
        let newGameStates = gameStates.reduce(into: gameStates) { allGameStates, gameState in
            let (state, amount) = gameState
            if state.p1.won || state.p2.won {
                return
            }

            allGameStates[state] = (allGameStates[state] ?? 0) - amount

            for (score, count) in rolls {
                var player = state.p1.isPlaying ? state.p1 : state.p2
                let newPos = move(position: player.position, distance: score)
                player = Player(
                    position: newPos,
                    score: player.score + newPos,
                    isPlaying: false
                )

                let newState = state.p1.isPlaying
                    ? Part2GameState(p1: player, p2: state.p2.toggleIsPlaying())
                    : Part2GameState(p1: state.p1.toggleIsPlaying(), p2: player)

                allGameStates[newState] = (allGameStates[newState] ?? 0) + (count * amount)
            }
        }

        if newGameStates == gameStates {
            gameStates = gameStates.filter { state, count in count != 0 }
            break
        }
        gameStates = newGameStates
    }

    let wins = gameStates.reduce((0,0)) { res, counts in
        counts.key.p1.won
            ? ( res.0 + counts.value, res.1 )
            : ( res.0, res.1 + counts.value )
    }

    return max(wins.0, wins.1)
}

//print("Part 1", Part1(player1Start: 3, player2Start: 4).play())
//print("Part 2", part2(start1: 3, start2: 4))

