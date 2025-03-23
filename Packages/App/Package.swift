// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "App",
    defaultLocalization: "ko",
    platforms: [
        .iOS(.v18),
    ],
    products: [
        .library(
            name: "App",
            targets: [
                "App",
            ]
        ),
        .library(
            name: "AppUITests",
            targets: [
                "AppUITests",
            ]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-log.git", from: "1.6.3"),
        .package(path: "Core"),
    ],
    targets: [
        .target(
            name: "App",
            dependencies: [
                .product(name: "Logging", package: "swift-log"),
                .product(name: "Core", package: "Core"),
            ]
        ),
        .testTarget(
            name: "AppTests",
            dependencies: [
                "App",
            ]
        ),
        .target(
            name: "AppUITests",
            path: "Tests/AppUITests"
        )
    ]
)
