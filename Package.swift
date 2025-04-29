// swift-tools-version:5.5

import PackageDescription

let package = Package(
  name: "UJET",
  platforms: [
    .iOS(.v13)
  ],
  products: [
    .library(
      name: "UJETKit",
      targets: ["WrapperUJET", "WrapperUJETChatRed", "WrapperUJETCallRed"]),
    .library(
      name: "UJETCobrowseKit",
      targets: ["WrapperUJETCobrowse"]),
    .library(
      name: "UJETCobrowseExtensionKit",
      targets: ["WrapperUJETCobrowseExtension"]),
  ],
  dependencies: [
    .package(url: "https://github.com/twilio/conversations-ios", .upToNextMinor(from: "4.0.2")),
    .package(url: "https://github.com/twilio/twilio-voice-ios", .exact("6.10.4")),
    .package(url: "https://github.com/cobrowseio/cobrowse-sdk-ios-binary", .exact("2.29.6")),
  ],
  targets: [
    .binaryTarget(
      name: "UJETFoundationKit",
      url: "https://sdk.ujet.co/ios/2.12.0/UJETFoundationKit.xcframework.zip",
      checksum: "9b74b3b151c915680dc17ce21f247a0718629e596d855b812f2c80ddaf258499"
    ),

    .binaryTarget(
      name: "UJETKit",
      url: "https://sdk.ujet.co/ios/2.12.0/UJETKit.xcframework.zip",
      checksum: "ab10cc0d6be75c89c55910cd5d9598c04385850e2f15cfa0ecc9ad5238637e36"
    ),

    .binaryTarget(
      name: "UJETCobrowseKit",
      url: "https://sdk.ujet.co/ios/2.12.0/UJETCobrowseKit.xcframework.zip",
      checksum: "b68d42b65837c84de8e71ec6c176eb50062230cbf479993df1bf2199dca69f76"
    ),

    .binaryTarget(
      name: "UJETChatRedKit",
      url: "https://sdk.ujet.co/ios/2.12.0/UJETChatRedKit.xcframework.zip",
      checksum: "20511ee20084d9c0e57842799ba2aceaa2758ab4ec3bd90132486da1009b3b85"
    ),
    .binaryTarget(
      name: "UJETCallRedKit",
      url: "https://sdk.ujet.co/ios/2.12.0/UJETCallRedKit.xcframework.zip",
      checksum: "acea3d2970248c4822a5b0e07f19fe58de18a57460f45f2a38d49c3b60fa10b9"
    ),

    .target(
      name: "WrapperUJET",
      dependencies: [
        "UJETKit",
        "UJETFoundationKit",
        .product(name: "TwilioVoice", package: "twilio-voice-ios")
      ]
    ),

    .target(
      name: "WrapperUJETCobrowse",
      dependencies: [
        "UJETFoundationKit",
        "UJETCobrowseKit",
        .product(name: "CobrowseIO", package: "cobrowse-sdk-ios-binary")
      ]
    ),

    .target(
      name: "WrapperUJETCobrowseExtension",
      dependencies: [
        .product(name: "CobrowseIOAppExtension", package: "cobrowse-sdk-ios-binary")
      ]
    ),

    .target(
      name: "WrapperUJETChatRed",
      dependencies: [
        "UJETFoundationKit",
        "UJETChatRedKit",
        .product(name: "TwilioConversationsClient", package: "conversations-ios"),
      ]
    ),
    .target(
      name: "WrapperUJETCallRed",
      dependencies: [
        "UJETFoundationKit",
        "UJETCallRedKit",
        .product(name: "TwilioVoice", package: "twilio-voice-ios")
      ]
    )
  ]
)
