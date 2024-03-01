// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Networking",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "NetworkingData",
            targets: ["NetworkingData"]
        ),
        .library(
            name: "NetworkingDomain",
            targets: ["NetworkingDomain"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/Swinject/Swinject.git",
            from: "2.8.4"
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "NetworkingData",
            dependencies: ["NetworkingDomain", "Swinject"]
        ),
        .testTarget(
            name: "NetworkingDataTests",
            dependencies: ["NetworkingData"]
        ),
        .target(
            name: "NetworkingDomain"
        )
    ]
)
