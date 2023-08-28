import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: Feature.subscriptions.rawValue,
    targets: [
        .feature(
            implementation: .subscriptions,
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
