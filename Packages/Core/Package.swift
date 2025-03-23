// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Core",
    defaultLocalization: "ko",
    platforms: [
        .iOS(.v18),
    ],
    products: [
        .library(
            name: "Core",
            targets: [
                "Core",
            ]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-log.git", from: "1.6.3"),
        .package(path: "Coordinator"),
    ],
    targets: [
        .target(
            name: "Core",
            dependencies: [
                .product(name: "Logging", package: "swift-log"),
                .product(name: "Coordinator", package: "Coordinator"),
            ]
        ),
        .testTarget(
            name: "CoreTests",
            dependencies: [
                "Core",
            ]
        ),
    ]
)
