// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let rswiftRepository = "https://github.com/quentinfasquel/R.swift"

let package = Package(
    name: "R.swift.Plugin",
    platforms: [.iOS(.v11)],
    products: [
        .plugin(name: "RswiftPlugin", targets: ["RswiftPlugin"])
    ],
    targets: [
        .plugin(
            name: "RswiftPlugin",
            capability: .buildTool(),
            dependencies: ["rswift"]),
        .binaryTarget(
            name: "rswift",
            url: "\(rswiftRepository)/releases/download/5.4.0-spm/rswift.artifactbundle.zip",
            checksum: "0c2b7f766076b398eddc9b61d2d040e2806f3105894a48b4328a506f81d081bc")
    ]
)
