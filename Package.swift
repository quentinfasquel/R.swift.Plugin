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
            url: "\(rswiftRepository)/releases/download/6.0.0-spm/rswift.artifactbundle.zip",
            checksum: "357e8982f00e17a8d40027a40c1e01cfd90d5345ce0e30ae16fe78cba49704a7")
    ]
)
