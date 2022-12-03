// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "AdventOfCode",
    products: [
        .executable(name: "2022", targets: ["2022"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-algorithms", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-collections", from: "1.0.3"),
        .package(url: "https://github.com/SwiftGen/SwiftGenPlugin", from: "6.6.2"),
    ],
    targets: [
        .executableTarget(
            name: "2022",
            dependencies: [
                .product(name: "Algorithms", package: "swift-algorithms"),
                .product(name: "Collections", package: "swift-collections"),
            ],
            resources: [
                .process("Input"),
            ],
            swiftSettings: [.unsafeFlags(["-O"])],
            plugins: [
                .plugin(name: "SwiftGenPlugin", package: "SwiftGenPlugin"),
            ]
        ),
    ]
)
