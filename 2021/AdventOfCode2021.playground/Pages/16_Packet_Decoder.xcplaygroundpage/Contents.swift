import Foundation

let realInput = "820D4100A1000085C6E8331F8401D8E106E1680021708630C50200A3BC01495B99CF6852726A88014DC9DBB30798409BBDF5A4D97F5326F050C02F9D2A971D9B539E0C93323004B4012960E9A5B98600005DA7F11AFBB55D96AFFBE1E20041A64A24D80C01E9D298AF0E22A98027800BD4EE3782C91399FA92901936E0060016B82007B0143C2005280146005300F7840385380146006900A72802469007B0001961801E60053002B2400564FFCE25FEFE40266CA79128037500042626C578CE00085C718BD1F08023396BA46001BF3C870C58039587F3DE52929DFD9F07C9731CC601D803779CCC882767E668DB255D154F553C804A0A00DD40010B87D0D6378002191BE11C6A914F1007C8010F8B1122239803B04A0946630062234308D44016CCEEA449600AC9844A733D3C700627EA391EE76F9B4B5DA649480357D005E622493112292D6F1DF60665EDADD212CF8E1003C29193E4E21C9CF507B910991E5A171D50092621B279D96F572A94911C1D200FA68024596EFA517696EFA51729C9FB6C64019250034F3F69DD165A8E33F7F919802FE009880331F215C4A1007A20C668712B685900804ABC00D50401C89715A3B00021516E164409CE39380272B0E14CB1D9004632E75C00834DB64DB4980292D3918D0034F3D90C958EECD8400414A11900403307534B524093EBCA00BCCD1B26AA52000FB4B6C62771CDF668E200CC20949D8AE2790051133B2ED005E2CC953FE1C3004EC0139ED46DBB9AC9C2655038C01399D59A3801F79EADAD878969D8318008491375003A324C5A59C7D68402E9B65994391A6BCC73A5F2FEABD8804322D90B25F3F4088F33E96D74C0139CF6006C0159BEF8EA6FBE3A9CEC337B859802B2AC9A0084C9DCC9ECD67DD793004E669FA2DE006EC00085C558C5134001088E308A20"

func toBinary(input: String) -> [Int] {
    input.reduce(into: []) { total, digit in
        String(String(UInt8(String(digit), radix: 16)!, radix: 2).reversed())
            .padding(toLength: 4, withPad: "0", startingAt: 0)
            .reversed()
            .forEach {
                total.append(Int(String($0))!)
            }
    }
}

extension Array where Element == Int {
    var toDecimal: Int {
        reduce(into: 0) {
            $0 <<= 1
            $0 += $1
        }
    }
}

indirect enum Packet: CustomStringConvertible {
    case literal(version: Int, id: Int, value: Int)
    case operat(version: Int, id: Int, packets: [Packet])

    var versionSum: Int {
        switch self {
            case let .literal(version, _, _):
                return version
            case let .operat(version, _, packets):
                return version + packets.map(\.versionSum).reduce(0, +)
        }
    }

    var description: String {
        switch self {
            case let .literal(version, _, literalValue):
                return "v\(version) \(literalValue)"
            case let .operat(version, id, packets):
                let symbols = [0: "+",1: "*",2: "min",3: "max",5: ">",6: "<",7: "=="]
                return "v\(version) \(symbols[id]!): \(packets) = \(value)"
        }
    }

    var value: Int {
        switch self {
            case let .literal(_, _, literalValue):
                return literalValue
            case let .operat(_, id, packets):
                switch id {
                    case 0:
                        return packets.map(\.value).reduce(0, +)
                    case 1:
                        return packets.map(\.value).reduce(1, *)
                    case 2:
                        return packets.map(\.value).reduce(Int.max, min)
                    case 3:
                        return packets.map(\.value).reduce(Int.min, max)
                    case 5:
                        return packets.first!.value > packets.last!.value ? 1 : 0
                    case 6:
                        return packets.first!.value < packets.last!.value ? 1 : 0
                    case 7:
                        return packets.first!.value == packets.last!.value ? 1 : 0
                    default:
                        fatalError("Unknown ID")
                }
        }
    }
}

func decode(binary: inout [Int], maxPackets: Int = Int.max) -> [Packet] {
    var packets: [Packet] = []
    while binary.count > 0 {
        let version = [binary.removeFirst(), binary.removeFirst(), binary.removeFirst()].toDecimal
        let id = [binary.removeFirst(), binary.removeFirst(), binary.removeFirst()].toDecimal
        switch id {
            case 4:
                packets.append(decodeLiteral(binary: &binary, id: id, version: version))
            default:
                packets.append(decodeOperator(binary: &binary, id: id, version: version))
        }
        if !binary.contains(1) || packets.count == maxPackets {
            break
        }
    }
    return packets
}

func decodeLiteral(binary: inout [Int], id: Int, version: Int) -> Packet {
    var bits: [Int] = []
    while true {
        let isLastGroup = binary.removeFirst() == 0
        bits += (0..<4).map { _ in binary.removeFirst() }
        if isLastGroup {
            return .literal(version: version, id: id, value: bits.toDecimal)
        }
    }
}

func decodeOperator(binary: inout [Int], id: Int, version: Int) -> Packet {
    if binary.removeFirst() == 0 {
        let length = (0..<15).map { _ in binary.removeFirst() }
        var binarySubpackets = Array(binary.prefix(upTo: length.toDecimal))
        let subPackets = decode(binary: &binarySubpackets)
        binary.removeFirst(length.toDecimal)
        return .operat(version: version, id: id, packets: subPackets)
    } else {
        let length = (0..<11).map { _ in binary.removeFirst() }
        let subPackets = decode(binary: &binary, maxPackets: length.toDecimal)
        return .operat(version: version, id: id, packets: subPackets)
    }
}

let testHexPackets = [
    // Part 1
    "D2FE28", // v6, literal 2021
    "38006F45291200", // v1 10 + 20
    "EE00D40C823060", // v7, 1 + 2 + 3
    "8A004A801A8002F478", // v4 operator -> v1 operator -> v5 operator -> v6 literal; Version sum of 16.
    "620080001611562C8802118E34", // v3 operator -> 2 operators -> literals; Veersion sum of 12.
    "C0015000016115A2E0802F182340", // Same but the outermost packet uses a different length type ID; Version sum of 23.
    "A0016C880162017C3686B18A3D4780", // operator -> operator -> operator packet -> 5x literals; Version sum of 31.

    // Part 2
    "C200B40A82", // finds the sum of 1 and 2, resulting in the value 3.
    "04005AC33890", // finds the product of 6 and 9, resulting in the value 54.
    "880086C3E88112", // finds the minimum of 7, 8, and 9, resulting in the value 7.
    "CE00C43D881120", // finds the maximum of 7, 8, and 9, resulting in the value 9.
    "D8005AC2A8F0", // produces 1, because 5 is less than 15.
    "F600BC2D8F", // produces 0, because 5 is not greater than 15.
    "9C005AC2F8F0", // produces 0, because 5 is not equal to 15.
    "9C0141080250320F1802104A08" // produces 1, because 1 + 3 = 2 * 2.
]

//testHexPackets.forEach { hexNumber in
//    var binary = toBinary(input: hexNumber)
//    print(decode(binary: &binary).first!)
//}

var binary = toBinary(input: realInput)
let packets = decode(binary: &binary)
print("Version sums:", packets.first!.versionSum)
print("Value:", packets.first!.value)
