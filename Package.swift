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
    .package(url: "https://github.com/twilio/conversations-ios", .exact("4.0.7")),
    .package(url: "https://github.com/twilio/twilio-voice-ios", .exact("6.13.6")),
    .package(url: "https://github.com/cobrowseio/cobrowse-sdk-ios-binary", .exact("2.29.6")),
  ],
  targets: [
    .binaryTarget(
      name: "UJETFoundationKit",
      url: "https://sdk.ujet.co/ios-staging/2.17.0-rc.1/UJETFoundationKit.xcframework.zip",
      checksum: "d299bf42fae8ec9e2e4d1431e0da27c5be6155224a8a4fd4a02dc4ba485b517d"
    ),

    .binaryTarget(
      name: "UJETKit",
      url: "https://sdk.ujet.co/ios-staging/2.17.0-rc.1/UJETKit.xcframework.zip",
      checksum: "8c712524a58f6b5ad740fd8c8b0f0f57233d85b2fb7829c54ae94c9ae20fbb83"
    ),

    .binaryTarget(
      name: "UJETCobrowseKit",
      url: "https://sdk.ujet.co/ios-staging/2.17.0-rc.1/UJETCobrowseKit.xcframework.zip",
      checksum: "d695e39d887dbdb88427c87541171dc2bc027868c0b211e87a3e51b231a13b81"
    ),

    .binaryTarget(
      name: "UJETChatRedKit",
      url: "https://sdk.ujet.co/ios-staging/2.17.0-rc.1/UJETChatRedKit.xcframework.zip",
      checksum: "2671bdbc5c751ba7b6c2b69278c11c6148e2cc956d7c4f520fa0582f7a01614f"
    ),
    .binaryTarget(
      name: "UJETCallRedKit",
      url: "https://sdk.ujet.co/ios-staging/2.17.0-rc.1/UJETCallRedKit.xcframework.zip",
      checksum: "c4e78733bc8f7ee63f36de49a69be16e060f601b13d6c8a1a0e3ec983c0a8657"
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
