// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "OpenWeatherAPI",
    defaultLocalization: "ko",
    platforms: [
        .iOS(.v13),
        .macCatalyst(.v13)
    ],
    products: [
        .library(
            name: "OpenWeatherAPI",
            targets: [
                "OpenWeatherAPI"
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/jaemyeong/ErrorKit.git", .upToNextMajor(from: "0.1.7"))
    ],
    targets: [
        .target(
            name: "OpenWeatherAPI",
            dependencies: [
                "ErrorKit"
            ]
        ),
        .testTarget(
            name: "OpenWeatherAPITests",
            dependencies: [
                "OpenWeatherAPI"
            ]
        )
    ]
)
