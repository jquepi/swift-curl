// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "cURLLib",
    platforms: [.macOS(.v10_15), .iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "cURLLib",
            targets: ["cURLLib"]),
        .library(
            name: "cURLLib+AsyncHTTPClient",
            targets: ["cURLLib+AsyncHTTPClient"]),
        .library(
            name: "cURLLib+Vapor",
            targets: ["cURLLib+Vapor"]),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-server/async-http-client.git", from: "1.0.0"),
        .package(url: "https://github.com/vapor/vapor.git", from: "4.27.3"),
        
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "cURLLib",
            dependencies: []),
        .target(
            name: "cURLLib+AsyncHTTPClient",
            dependencies: [
                .target(name: "cURLLib"),
                .product(name: "AsyncHTTPClient", package: "async-http-client")
            ]),
        .target(
            name: "cURLLib+Vapor",
            dependencies: [
                .target(name: "cURLLib"),
                .product(name: "Vapor", package: "vapor")
            ]),
        .testTarget(
            name: "cURLLibTests",
            dependencies: ["cURLLib", "cURLLib+Vapor", .product(name: "XCTVapor", package: "vapor")]),
    ]
)
