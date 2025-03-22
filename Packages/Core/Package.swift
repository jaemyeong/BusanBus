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
    targets: [
        .target(
            name: "Core"
        ),
        .testTarget(
            name: "CoreTests",
            dependencies: [
                "Core",
            ]
        ),
    ]
)
