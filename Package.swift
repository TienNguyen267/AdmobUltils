// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdmobUltils",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AdmobUltils",
            targets: ["AdmobUltils"]
        ),
    ],
    dependencies: [
        // Facebook SDK
        .package(url: "https://github.com/facebook/facebook-ios-sdk", from: "14.1.0"),
        // Lottie for animations
        .package(url: "https://github.com/airbnb/lottie-ios", from: "4.5.2"),
        // Google Mobile Ads
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads", from: "12.14.0"),
        // Google User Messaging Platform
//        .package(url: "https://github.com/googleads/swift-package-manager-google-user-messaging-platform", from: "3.1.0"),
        // SwiftUI Shimmer
        .package(url: "https://github.com/markiv/SwiftUI-Shimmer", from: "1.5.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "AdmobUltils",
            dependencies: [
                .product(name: "FacebookCore", package: "facebook-ios-sdk"),
                .product(name: "Lottie", package: "lottie-ios"),
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
//                .product(name: "UserMessagingPlatform", package: "swift-package-manager-google-user-messaging-platform"),
                .product(name: "Shimmer", package: "SwiftUI-Shimmer")
            ]
        ),

    ]
)
