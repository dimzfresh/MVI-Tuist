import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: Feature.new.rawValue,
    targets: [
        .feature(
            implementation: .new,
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
