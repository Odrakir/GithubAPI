// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "GithubAPI",
    platforms: [.macOS(.v10_15), .iOS(.v13)],
    products: [
        .library(
            name: "GithubAPI",
            targets: ["GithubAPI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Odrakir/CombineNetworking", from: "0.1.0")
    ],
    targets: [
        .target(
            name: "GithubAPI",
            dependencies: ["CombineNetworking"]),
        .testTarget(
            name: "GithubAPITests",
            dependencies: ["GithubAPI"]),
    ]
)
