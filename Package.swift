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
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.0.0/CCAIKit.xcframework.zip",
      checksum: "95fa169c32dbcad826411e8a97041e23b190f197ac1902b3d4dbc094c738346c"
    ),

    .binaryTarget(
      name: "CCAIChat",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.0.0/CCAIChat.xcframework.zip",
      checksum: "e56a76d2be383ed35f08a69b925ecd0d99baa7c728437ab438023683aad2f82c"
    ),

    .binaryTarget(
      name: "CCAIChatRed",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.0.0/CCAIChatRed.xcframework.zip",
      checksum: "62ec6eb4551a1d8d3e6760fb557d469a36e34f0e660ad035473820bbfe0cd05d"
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
