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
    .package(url: "https://github.com/cobrowseio/cobrowse-sdk-ios-binary", .upToNextMinor(from: "3.9.0"))
  ],
  targets: [
    .binaryTarget(
      name: "CCAIKit",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.1.0-rc.02/CCAIKit.xcframework.zip",
      checksum: "4dbe1fdc4a7ae2efa9b91d07d2e5632c85494af98cd9ba7e4bf877e99a43c594"
    ),

    .binaryTarget(
      name: "CCAIChat",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.1.0-rc.02/CCAIChat.xcframework.zip",
      checksum: "25f02d8ecade8519f8dadd2313863798415e2427847fe6d6cdb3c4b21798edcf"
    ),

    .binaryTarget(
      name: "CCAIChatRed",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.1.0-rc.02/CCAIChatRed.xcframework.zip",
      checksum: "276318426b63c276014b57b064ff5962ec10f5c088aa8b97ec9a354c7db77a91"
    ),

    .binaryTarget(
      name: "CCAIScreenShare",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.1.0-rc.02/CCAIScreenShare.xcframework.zip",
      checksum: "db2990601f7eccc65bfab943c37aef24643741cbb26e82bbf2458d5dc171d88f"
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
