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
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.2.0-rc.2/CCAIKit.xcframework.zip",
      checksum: "93d9915080b5fb0fbdb6bbbc8b128952bec4c29942892dd07c886435c872e079"
    ),

    .binaryTarget(
      name: "CCAIChat",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.2.0-rc.2/CCAIChat.xcframework.zip",
      checksum: "fbbe4dcb8fedf1b648058b9aa5269cfa49aa582cde0054e699442fc202de3376"
    ),

    .binaryTarget(
      name: "CCAIChatRed",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.2.0-rc.2/CCAIChatRed.xcframework.zip",
      checksum: "8db2396d8c79084f04e6c949af358305246daa47fdd8cf937465af7841068768"
    ),

    .binaryTarget(
      name: "CCAIScreenShare",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.2.0-rc.2/CCAIScreenShare.xcframework.zip",
      checksum: "4d01f94578aa27e172593fa26237cf9b970cafa76de33015b2203e045e5b6e17"
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
