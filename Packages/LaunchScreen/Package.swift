// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "LaunchScreen",
    defaultLocalization: "ko",
    platforms: [
        .iOS(.v18),
    ],
    products: [
        .library(
            name: "LaunchScreen",
            targets: [
                "LaunchScreen",
            ]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-log.git", from: "1.6.3"),
        .package(path: "Core"),
    ],
    targets: [
        .target(
            name: "LaunchScreen",
            dependencies: [
                .product(name: "Logging", package: "swift-log"),
                .product(name: "Core", package: "Core"),
            ]
        ),
        .testTarget(
            name: "LaunchScreenTests",
            dependencies: [
                "LaunchScreen",
            ]
        ),
        .target(
            name: "LaunchScreenUITests",
            path: "Tests/LaunchScreenUITests"
        )
    ]
)
