import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: Feature.add.rawValue,
    targets: [
        .feature(
            implementation: .add,
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
