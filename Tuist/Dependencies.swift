import ProjectDescription
import ProjectDescriptionHelpers

let spmDependencies = SwiftPackageManagerDependencies(
    [
        .remote(url: "https://github.com/SnapKit/SnapKit.git",
                requirement: .exact("5.6.0")),
        .remote(url: "https://github.com/onevcat/Kingfisher.git", requirement: .upToNextMajor(from: "7.0.0"))
    ],
    productTypes: [
        "SnapKit": ProjectDescriptionHelpers.defaultPackageType,
        "Kingfisher": ProjectDescriptionHelpers.defaultPackageType
    ]
)

let dependencies = Dependencies(
    swiftPackageManager: spmDependencies,
    platforms: [
        .iOS
    ]
)
