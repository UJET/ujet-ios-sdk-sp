# Swift Package for iOS SDK

Swift Package Manager distribution of the **UJET iOS SDK**.

This repository contains only the package manifest. The SDK itself is shipped as prebuilt binary XCFrameworks that are downloaded when the package is resolved.

## Requirements

- iOS 13.0+
- Swift tools 5.5+ (Xcode 13+)

## Installation

In Xcode, choose **File > Add Package Dependencies…** and enter:

```
https://github.com/UJET/ujet-ios-sdk-sp
```

Or add it to your `Package.swift`:

```swift
dependencies: [
  .package(url: "https://github.com/UJET/ujet-ios-sdk-sp", .upToNextMajor(from: "2.17.2"))
]
```

## Products

| Product | Includes |
| --- | --- |
| `UJETKit` | Core SDK with chat and call |
| `UJETCobrowseKit` | Co-browse |
| `UJETCobrowseExtensionKit` | Co-browse for a Broadcast Upload Extension (full-device screen sharing) |

Third-party dependencies (Twilio Conversations, Twilio Voice, Cobrowse.io) are resolved automatically.
