// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HopotPackage",
    platforms: [
        .macOS("10.15"),
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "HopotPackage",
            targets: ["HopotPackage"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "HopotPackage",
            //如果要在本项目使用，需要依赖Target
            dependencies: ["Cat","HotpotCat"]
        ),
        .binaryTarget(
            name: "Cat",
            path: "framework/Cat.xcframework"
        ),
        .binaryTarget(
           name: "HotpotCat",
           url: "https://github.com/binxiao0604/HotpotCatTest/releases/download/1.1.0/HotpotCat.xcframework.zip",
           //1.下载下来HotpotCat.xcframework.zip
           //2.需要在本工程计算，swift package compute-checksum /Users/zaizai/Desktop/HotpotCat/HotpotCat.xcframework.zip
           //3.这里更改版本也就是URL和checksum需要清理缓存重新编译
           checksum: "7d8bdb4297ff837ffe2ae87d211283c8fa5b5ab9199540b1617da1a63ce638a2"
        )
    ]
)
