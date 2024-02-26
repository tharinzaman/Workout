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
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "TestingUtils"
        ),
        .target(
            name: "NetworkingData",
            dependencies: ["NetworkingDomain"]
        ),
        .testTarget(
            name: "NetworkingDataTests",
            dependencies: ["NetworkingData", "TestingUtils"]
        ),
        .target(
            name: "NetworkingDomain"
        ),
        .testTarget(
            name: "NetworkingDomainTests",
            dependencies: ["NetworkingDomain", "TestingUtils"]
        )
    ]
)
