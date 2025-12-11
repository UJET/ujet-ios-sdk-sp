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
      targets: ["WrapperCCAIScreenShare"])
  ],
  dependencies: [
    .package(url: "https://github.com/twilio/conversations-ios", .upToNextMinor(from: "4.0.4")),
    .package(url: "https://github.com/cobrowseio/cobrowse-sdk-ios-binary", .upToNextMinor(from: "3.13.4"))
  ],
  targets: [
    .binaryTarget(
      name: "CCAIKit",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.2.1/CCAIKit.xcframework.zip",
      checksum: "c19da11f000e89ae57e86e1ecf3a1a9ea457b95b708f259c71e1f5aa124d4287"
    ),

    .binaryTarget(
      name: "CCAIChat",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.2.1/CCAIChat.xcframework.zip",
      checksum: "20fff79ff8fb4ab90ede852c9b756fdbf89370ac904cb287d3c0828a7bbd4a58"
    ),

    .binaryTarget(
      name: "CCAIChatRed",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.2.1/CCAIChatRed.xcframework.zip",
      checksum: "3d8b6e5e03fc033d9e33ebe2337e5315a49e1b4605cabafce8b006057ab6682d"
    ),

    .binaryTarget(
      name: "CCAIScreenShare",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.2.1/CCAIScreenShare.xcframework.zip",
      checksum: "34e548eb23f92c37d5d045619446c96c29bb0d910f6434bbfa4a02ffa4414b7c"
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
