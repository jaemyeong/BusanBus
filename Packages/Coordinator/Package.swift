// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Coordinator",
    defaultLocalization: "ko",
    platforms: [
        .iOS(.v18),
    ],
    products: [
        .library(
            name: "Coordinator",
            targets: [
                "Coordinator",
            ]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-log.git", from: "1.6.3"),
        .package(path: "LaunchScreen"),
        .package(path: "App"),
    ],
    targets: [
        .target(
            name: "Coordinator",
            dependencies: [
                .product(name: "Logging", package: "swift-log"),
                .product(name: "LaunchScreen", package: "LaunchScreen"),
                .product(name: "App", package: "App"),
            ]
        ),
        .testTarget(
            name: "CoordinatorTests",
            dependencies: [
                "Coordinator",
            ]
        ),
    ]
)
