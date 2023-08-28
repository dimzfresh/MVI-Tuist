import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: Feature.activity.rawValue,
    targets: [
        .feature(
            implementation: .activity,
            dependencies: [
                .common,
                .appUIKit,
                .external(.snapKit),
                .external(.kingfisher)
            ],
            resources: [
                "Sources/Resources/**"
            ]
        )
    ]
)
