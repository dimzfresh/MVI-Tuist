import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: Feature.authorization.rawValue,
    targets: [
        .feature(
            implementation: .authorization,
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
