// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "WeatherIndicatorView",
    defaultLocalization: "ko",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "WeatherIndicatorView",
            targets: [
                "WeatherIndicatorView"
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/jaemyeong/OpenColorKit.git", .upToNextMajor(from: "0.1.4")),
        .package(url: "https://github.com/jaemyeong/ErrorKit.git", .upToNextMajor(from: "0.1.5"))
    ],
    targets: [
        .target(
            name: "WeatherIndicatorView",
            dependencies: [
                "OpenColorKit",
                "ErrorKit"
            ]
        ),
        .testTarget(
            name: "WeatherIndicatorViewTests",
            dependencies: [
                "WeatherIndicatorView"
            ]
        )
    ]
)
