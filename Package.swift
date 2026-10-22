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
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealAmazonAdapter/5.6.6.1/8ba33ba6b663/AppodealAmazonAdapter.xcframework.zip",
            checksum: "8ba33ba6b6630a1aafc317dfb84098472724ae981be941522a862a871c413b89"
        ),

    ]
)
