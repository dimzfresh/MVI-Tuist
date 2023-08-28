import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: Feature.app.rawValue,
    targets: [
        .makeApp(
            name: "App",
            resources: [
                "Sources/Resources/**"
            ],
            sources: [
                "Sources/**"
            ],
            dependencies: [
                .common,
                .appUIKit,
                .feature(implementation: .authorization),
                .feature(implementation: .feed),
                .feature(implementation: .activity),
                .feature(implementation: .add),
                .feature(implementation: .new),
                .feature(implementation: .subscriptions)
            ]
        )
    ]
)
