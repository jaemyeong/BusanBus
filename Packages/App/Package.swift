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
        .package(path: "Core"),
    ],
    targets: [
        .target(
            name: "App",
            dependencies: [
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
