// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "BusanBusCoordinator",
    defaultLocalization: "ko",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "BusanBusCoordinator",
            targets: [
                "BusanBusCoordinator"
            ]
        )
    ],
    dependencies: [
        .package(path: "BusanBusMain"),
        .package(url: "https://github.com/jaemyeong/ErrorKit.git", .upToNextMajor(from: "0.1.5"))
    ],
    targets: [
        .target(
            name: "BusanBusCoordinator",
            dependencies: [
                "BusanBusMain",
                "ErrorKit"
            ]
        ),
        .testTarget(
            name: "BusanBusCoordinatorTests",
            dependencies: [
                "BusanBusCoordinator"
            ]
        )
    ]
)
