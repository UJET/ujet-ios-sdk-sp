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
      url: "https://sdk.ujet.co/ccaip/ios/3.2.0/CCAIKit.xcframework.zip",
      checksum: "a025a1bfa0d565fbc6170a2a0b815d7eb7c8e020ee4d52baaa8942eab4a6d9e4"
    ),

    .binaryTarget(
      name: "CCAIChat",
      url: "https://sdk.ujet.co/ccaip/ios/3.2.0/CCAIChat.xcframework.zip",
      checksum: "98f2ca47fa24553e2924f3b6036aeae7fbdce795af5bf6c70d154c61fc891b4f"
    ),

    .binaryTarget(
      name: "CCAIChatRed",
      url: "https://sdk.ujet.co/ccaip/ios/3.2.0/CCAIChatRed.xcframework.zip",
      checksum: "3aebca988ab64c586b9a97cfc6fb8b136870fd13eacaaa3c632bb473c9219eda"
    ),

    .binaryTarget(
      name: "CCAIScreenShare",
      url: "https://sdk.ujet.co/ccaip/ios/3.2.0/CCAIScreenShare.xcframework.zip",
      checksum: "293bdf143bf4d2b49831f7f6226b0391584895304bfa87ff3d2f5fd6b68af6c7"
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
