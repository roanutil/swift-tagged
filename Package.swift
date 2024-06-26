// swift-tools-version: 5.9

import Foundation
import PackageDescription

var package = Package(
  name: "swift-tagged",
  products: [
    .library(name: "Tagged", targets: ["Tagged"]),
    .library(name: "TaggedMoney", targets: ["TaggedMoney"]),
    .library(name: "TaggedTime", targets: ["TaggedTime"]),
  ],
  targets: [
    .target(name: "Tagged", dependencies: []),
    .testTarget(name: "TaggedTests", dependencies: ["Tagged"]),

    .target(name: "TaggedMoney", dependencies: ["Tagged"]),
    .testTarget(name: "TaggedMoneyTests", dependencies: ["TaggedMoney"]),

    .target(name: "TaggedTime", dependencies: ["Tagged"]),
    .testTarget(name: "TaggedTimeTests", dependencies: ["TaggedTime"]),
  ]
)

for target in package.targets {
  target.swiftSettings = target.swiftSettings ?? []
  target.swiftSettings!.append(contentsOf: [
    .enableExperimentalFeature("StrictConcurrency")
  ])
}
