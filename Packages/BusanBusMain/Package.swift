// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "BusanBusMain",
    defaultLocalization: "ko",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "BusanBusMain",
            targets: [
                "BusanBusMain"
            ]
        )
    ],
    dependencies: [
        .package(path: "WeatherIndicatorView"),
        .package(url: "https://github.com/jaemyeong/OpenColorKit.git", .upToNextMajor(from: "0.1.4")),
        .package(url: "https://github.com/jaemyeong/NMapsMap-SPM.git", .upToNextMajor(from: "3.15.0")),
        .package(url: "https://github.com/adfit/adfit-spm.git", .upToNextMajor(from: "3.11.5")),
        .package(url: "https://github.com/jaemyeong/ErrorKit.git", .upToNextMajor(from: "0.1.5"))
    ],
    targets: [
        .target(
            name: "BusanBusMain",
            dependencies: [
                "WeatherIndicatorView",
                "OpenColorKit",
                .product(name: "NMapsMap", package: "NMapsMap-SPM"),
                .product(name: "AdFitSDK", package: "adfit-spm"),
                "ErrorKit"
            ]
        ),
        .testTarget(
            name: "BusanBusMainTests",
            dependencies: [
                "BusanBusMain"
            ]
        )
    ]
)
