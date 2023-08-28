import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: Feature.feed.rawValue,
    targets: [
        .feature(
            implementation: .feed,
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
