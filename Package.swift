// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "AppodealAmazonAdapter",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "AppodealAmazonAdapter",
            targets: ["AppodealAmazonAdapterWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/appodeal/Appodeal-Swift-Package.git", .upToNextMajor(from: "4.0.0-alpha.1")),
        .package(url: "https://github.com/amzn/swift-package-manager-amazon-aps", exact: "5.6.6"),
    ],
    targets: [
        .target(
            name: "AppodealAmazonAdapterWrapper",
            dependencies: [
                .product(name: "AppodealSDK", package: "Appodeal-Swift-Package"),
                .product(name: "AmazonPublisherServicesSDK", package: "swift-package-manager-amazon-aps"),
                .target(name: "AppodealAmazonAdapter"),
            ],
            path: "Sources",
            sources: ["Exports.swift"]
        ),
        .binaryTarget(
            name: "AppodealAmazonAdapter",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealAmazonAdapter/5.6.6.0/205b2b2db99c/AppodealAmazonAdapter.xcframework.zip",
            checksum: "205b2b2db99cdb01be7cd057326df6683da60f7bbc4815abff9315679e57494a"
        ),

    ]
)
