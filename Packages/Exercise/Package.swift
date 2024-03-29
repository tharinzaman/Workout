// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Exercise",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ExerciseDomain",
            targets: ["ExerciseDomain"]
        ),
        .library(
            name: "ExercisePresentation",
            targets: ["ExercisePresentation"]
        )
    ],
    dependencies: [
        .package(
            path: "../Packages/Core"
        ),
        .package(
            path: "../Packages/Networking"
        ),
        .package(
            url: "https://github.com/Swinject/Swinject.git",
            from: "2.8.4"
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ExerciseDomain"
        ),
        .target(
            name: "ExercisePresentation",
            dependencies: [
                "ExerciseDomain",
                "Swinject",
                .product(
                    name: "Alerts",
                    package: "Core"
                ),
                .product(
                    name: "NetworkingDomain",
                    package: "Networking"
                ),
                .product(
                    name: "NetworkingData",
                    package: "Networking"
                )
            ]
        ),
        .testTarget(
            name: "ExercisePresentationTests",
            dependencies: ["ExercisePresentation"]
        )
    ]
)

