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
    ],
    targets: [
        .target(
            name: "App"
        ),
        .testTarget(
            name: "AppTests",
            dependencies: [
                "App",
            ]
        ),
    ]
)
