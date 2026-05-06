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
      url: "https://sdk.ujet.co/ios/2.15.3/UJETFoundationKit.xcframework.zip",
      checksum: "c871cc7916a67b5a7fe523960ee4511ff3a85fd1a3ce676ab6f7bef805ef5d6a"
    ),

    .binaryTarget(
      name: "UJETKit",
      url: "https://sdk.ujet.co/ios/2.15.3/UJETKit.xcframework.zip",
      checksum: "aaa47d7c8e2d1e2a42fd1a533b51d4aa5805693b68fde2b9acedd110c41203c2"
    ),

    .binaryTarget(
      name: "UJETCobrowseKit",
      url: "https://sdk.ujet.co/ios/2.15.3/UJETCobrowseKit.xcframework.zip",
      checksum: "6d585d254fa424b63bc3d7e39a030ee4e8e76af4aede6992a67051e26c62f03d"
    ),

    .binaryTarget(
      name: "UJETChatRedKit",
      url: "https://sdk.ujet.co/ios/2.15.3/UJETChatRedKit.xcframework.zip",
      checksum: "7cf8303ce5f1cc224ed959b131659d60862acd775b1c162c4f836d80ad52c4de"
    ),
    .binaryTarget(
      name: "UJETCallRedKit",
      url: "https://sdk.ujet.co/ios/2.15.3/UJETCallRedKit.xcframework.zip",
      checksum: "2ad0490b178920996e22ea0851491f86b7336312ffbe022d977bb05eec11f146"
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
