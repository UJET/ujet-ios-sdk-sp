// swift-tools-version:5.7

import PackageDescription

let package = Package(
  name: "CCAIKit",
  platforms: [
    .iOS(.v16)
  ],
  products: [
    .library(
      name: "CCAIKit",
      targets: ["WrapperCCAIKit", "WrapperCCAIChat", "WrapperCCAIChatRed"]),
    .library(
      name: "CCAIScreenShare",
      targets: ["WrapperCCAIScreenShare"]),
  ],
  dependencies: [
    .package(url: "https://github.com/twilio/conversations-ios", .upToNextMinor(from: "4.0.4")),
    .package(url: "https://github.com/cobrowseio/cobrowse-sdk-ios-binary", .upToNextMinor(from: "3.9.0")),
  ],
  targets: [
    .binaryTarget(
      name: "CCAIKit",
      url: "https://sdk.ujet.co/ccaip/ios/3.1.0/CCAIKit.xcframework.zip",
      checksum: "c23d8a730d2cce56d980d389509173d686798c6be5289ede490d056cb003aa10"
    ),

    .binaryTarget(
      name: "CCAIChat",
      url: "https://sdk.ujet.co/ccaip/ios/3.1.0/CCAIChat.xcframework.zip",
      checksum: "f9fbc5807ee5a8bb67b6f787df404e452aa77e477ce93da4e5bf2a0ee834e00a"
    ),

    .binaryTarget(
      name: "CCAIChatRed",
      url: "https://sdk.ujet.co/ccaip/ios/3.1.0/CCAIChatRed.xcframework.zip",
      checksum: "4017f6f80b28950a8d994551f71fea78fc2aa0abdabf4fe6af18066bcd0b06c5"
    ),

    .binaryTarget(
      name: "CCAIScreenShare",
      url: "https://sdk.ujet.co/ccaip/ios/3.1.0/CCAIScreenShare.xcframework.zip",
      checksum: "0aeee63f7648d5b991398f631f04fd198a66ffa1e37dc12cb1a5683168a0d752"
    ),

    .target(
      name: "WrapperCCAIKit",
      dependencies: [
        "CCAIKit"
      ]
    ),

    .target(
      name: "WrapperCCAIChat",
      dependencies: [
        "CCAIKit",
        "CCAIChat"
      ]
    ),

    .target(
      name: "WrapperCCAIChatRed",
      dependencies: [
        "CCAIKit",
        "CCAIChat",
        "CCAIChatRed",
        .product(name: "TwilioConversationsClient", package: "conversations-ios")
      ]
    ),

    .target(
      name: "WrapperCCAIScreenShare",
      dependencies: [
        "CCAIKit",
        "CCAIScreenShare",
        .product(name: "CobrowseSDK", package: "cobrowse-sdk-ios-binary")
      ]
    )
  ]
)
