// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Core",
    platforms: [
        .iOS(.v13)
      ],
    products: [
        .library(
            name: "UIComponents",
            targets: ["UIComponents"]),
        .library(
            name: "Coordinator",
            targets: ["Coordinator"]),
        .library(
            name: "DesignSystem",
            targets: ["DesignSystem"]),
        .library(
            name: "Extensions",
            targets: ["Extensions"]),
        .library(
            name: "Utilities",
            targets: ["Utilities"])
    ],
    dependencies: [
        .package(url: "https://github.com/SDWebImage/SDWebImage.git", from: "5.1.0")
    ],
    targets: [
        .target(
            name: "UIComponents",
            dependencies: ["DesignSystem"]),
        .target(
            name: "Coordinator",
            dependencies: []),
        .target(
            name: "DesignSystem",
            dependencies: []),
        .target(
            name: "Extensions",
            dependencies: [
                .product(name: "SDWebImage", package: "SDWebImage")
            ]),
        .target(
            name: "Utilities",
            dependencies: [])
    ]
)
