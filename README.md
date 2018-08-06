#

<img src="https://raw.githubusercontent.com/huynguyen-n/GhostTyping/master/meta/repo_banner.png"/>

[![Build Status](https://travis-ci.com/huynguyen-n/GhostTyping.svg?branch=master)](https://travis-ci.com/huynguyen-n/GhostTyping) [![Platform](https://img.shields.io/badge/platform-ios-green.svg?style=flat-square)](https://github.com/huynguyen-n/GhostTyping) [![](https://img.shields.io/badge/Swift-3.2-blue.svg?style=flat-square)](https://github.com/huynguyen-n/GhostTyping) [![License](https://img.shields.io/cocoapods/l/GhostTyping.svg?style=flat-square)](LICENSE) 
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/GhostTyping.svg)](https://img.shields.io/cocoapods/v/GhostTyping.svg)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![GitHub issues](https://img.shields.io/github/issues/huynguyen-n/GhostTyping.svg?style=flat-square)](https://github.com/huynguyen-n/GhostTyping/issues)

## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate GhostTyping into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'GhostTyping'
end
```

Then, run the following command:

```bash
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](https://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate GhostTyping into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "huynguyen-n/GhostTyping"
```

Run `carthage update` to build the framework and drag the built `GhostTyping.framework` into your Xcode project.

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler.

Once you have your Swift package set up, adding GhostTyping as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/huynguyen-n/GhostTyping.git")
]
```

## How to use
For complete documentation, [visit CocoaPods' auto-generated doc](http://cocoadocs.org/docsets/GhostTyping/)

GhostTyping actually is a subclass of UIView which intergrated the UITextField inside to make the type writing animation.

### Import
```swift
import GhostTyping
```

## License

GhostTyping is available under the MIT license. See the [LICENSE](LICENSE) file for more info.



