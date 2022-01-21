// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "vapor-test",
    platforms: [
       .macOS(.v10_15)
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
        .package(url: "https://github.com/vapor/fluent.git", from: "4.0.0"),
        .package(url: "https://github.com/vapor/fluent-postgres-driver.git", from: "2.0.0"),
        .package(url: "https://github.com/vapor/leaf.git", from: "4.0.0"),
        .package(url: "https://github.com/vapor/jwt.git", from: "4.0.0"),
    ],
    targets: [
        .target(
            name: "App",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
//                .product(name: "Vapor", package: "vapor"),
                .product(name: "Fluent", package: "fluent"),
                .product(name: "FluentPostgresDriver", package: "fluent-postgres-driver"),
                .product(name: "Leaf", package: "leaf"),
                .product(name: "JWT", package: "jwt")
            ],
            swiftSettings: [
                // Enable better optimizations when building in Release configuration. Despite the use of
                // the `.unsafeFlags` construct required by SwiftPM, this flag is recommended for Release
                // builds. See <https://github.com/swift-server/guides/blob/main/docs/building.md#building-for-production> for details.
                .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release))
            ]
        ),
        .executableTarget(name: "Run", dependencies: [.target(name: "App")]),
        .testTarget(name: "AppTests", dependencies: [
            .target(name: "App"),
            .product(name: "XCTVapor", package: "vapor"),
        ])
    ]
)
//// swift-tools-version:5.1
//import PackageDescription
//
//let package = Package(
//    name: "vapor-test",
//    platforms: [
//       .macOS(.v10_15)
//    ],
//    dependencies: [
//        // 💧 A server-side Swift web framework.
//        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0-rc"),
//        .package(url: "https://github.com/vapor/fluent.git", from: "4.0.0-rc"),
//        .package(url: "https://github.com/vapor/fluent-mysql-driver.git", from: "4.0.0-rc"),
//        .package(url: "https://github.com/apple/swift-package-manager", .branch("master")),
//    ],
//    targets: [
//        .target(name: "App", dependencies: [
//            .product(name: "Fluent", package: "fluent"),
//            .product(name: "FluentMySQLDriver", package: "fluent-mysql-driver"),
//            .product(name: "Vapor", package: "vapor"),
//            "SwiftPM"
//        ]),
//        .target(name: "Run", dependencies: ["App"]),
//        .testTarget(name: "AppTests", dependencies: [
//            .target(name: "App"),
//            .product(name: "XCTVapor", package: "vapor"),
//        ])
//    ]
//)
//
