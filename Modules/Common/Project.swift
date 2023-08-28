import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: Feature.common.rawValue,
    targets: [
        .feature(implementation: .common)
    ]
)
