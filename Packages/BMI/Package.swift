// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BMI",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "BmiData",
            targets: ["BmiData"]
        ),
        .library(
            name: "BmiDomain",
            targets: ["BmiDomain"]
        ),
        .library(
            name: "BmiPresentation",
            targets: ["BmiPresentation"]
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
            name: "BmiData",
            dependencies: [
                "BmiDomain",
                "Swinject"
            ]
        ),
        .testTarget(
            name: "BmiDataTests",
            dependencies: ["BmiData"]
        ),
        .target(
            name: "BmiDomain"
        ),
        .target(
            name: "BmiPresentation",
            dependencies: ["BmiDomain", "BmiData"]
        ),
        .testTarget(
            name: "BmiPresentationTests",
            dependencies: ["BmiPresentation"]
        )
    ]
)

