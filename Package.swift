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
      targets: ["WrapperCCAIKit", "WrapperCCAIChat", "WrapperCCAIChatRed"])
  ],
  dependencies: [
    .package(url: "https://github.com/twilio/conversations-ios", .upToNextMinor(from: "4.0.4"))
  ],
  targets: [
    .binaryTarget(
      name: "CCAIKit",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.0.0-rc1/CCAIKit.xcframework.zip",
      checksum: "322bc792571e62e28ff452b0ebc19b4afd898e8c2d1fe3339ddc6518a49dd197"
    ),

    .binaryTarget(
      name: "CCAIChat",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.0.0-rc1/CCAIChat.xcframework.zip",
      checksum: "ad3057f87390bfdeefe3de99b772f7420234f31eb2d6c48dbe0284266891a18e"
    ),

    .binaryTarget(
      name: "CCAIChatRed",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.0.0-rc1/CCAIChatRed.xcframework.zip",
      checksum: "240f73c7993e6666c5b26dd0456cc8ffdf15c7f311a3ebfcd8d7ddab24760807"
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
        .product(name: "TwilioConversationsClient", package: "conversations-ios")
      ]
    )
  ]
)
