import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: Feature.appUIKit.rawValue,
    targets: [
        .feature(
            implementation: .appUIKit,
            resources: [
                "Sources/Resources/**"
            ]
        )
    ]
)
