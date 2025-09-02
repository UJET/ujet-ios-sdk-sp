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
      url: "https://sdk.ujet.co/ios/2.14.0/UJETFoundationKit.xcframework.zip",
      checksum: "7f71f8360d6c970fa37ddcbe5b305554ef0da4da15dfab56af4fe6cae070331e"
    ),

    .binaryTarget(
      name: "UJETKit",
      url: "https://sdk.ujet.co/ios/2.14.0/UJETKit.xcframework.zip",
      checksum: "a0d5b3b48c889bdd28dad117860708dccd8fbe982919889552eab1d5d39ea81f"
    ),

    .binaryTarget(
      name: "UJETCobrowseKit",
      url: "https://sdk.ujet.co/ios/2.14.0/UJETCobrowseKit.xcframework.zip",
      checksum: "06daf3b934565b458b34f8d2767745403ee2d1b023339b69c7ca305738365cd5"
    ),

    .binaryTarget(
      name: "UJETChatRedKit",
      url: "https://sdk.ujet.co/ios/2.14.0/UJETChatRedKit.xcframework.zip",
      checksum: "9e8d22107a48c1eff4263c796c55efca7695b1e3a9fb2eeb8f7e781267adde2a"
    ),
    .binaryTarget(
      name: "UJETCallRedKit",
      url: "https://sdk.ujet.co/ios/2.14.0/UJETCallRedKit.xcframework.zip",
      checksum: "621ff04b98fdaabc8aecdbd0bffb18cba3be1415b80881cf06ec47640a6451ef"
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
