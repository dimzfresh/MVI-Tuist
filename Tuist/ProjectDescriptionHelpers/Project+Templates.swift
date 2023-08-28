import ProjectDescription

private let rootPackagesName = "demo.ios"

private func makeBundleID(with addition: String) -> String {
    (rootPackagesName + addition).lowercased()
}

private let targetVersion = "15.0"

private let targetScripts: [TargetScript] = [
    .pre(path: .relativeToRoot("Scripts/swiftlint.sh"), name: "Swiftlint.", basedOnDependencyAnalysis: false)
]

public extension Target {
    static func makeApp(
        name: String,
        resources: ProjectDescription.ResourceFileElements,
        sources: ProjectDescription.SourceFilesList,
        dependencies: [ProjectDescription.TargetDependency]
    ) -> Target {
        Target(
            name: name,
            platform: .iOS,
            product: .app,
            bundleId: makeBundleID(with: "-app"),
            deploymentTarget: .iOS(targetVersion: targetVersion, devices: .iphone),
            infoPlist: .extendingDefault(with: infoPlistExtension),
            sources: sources,
            resources: resources,
            scripts: targetScripts,
            dependencies: dependencies,
            settings: .settings(configurations: [
                .debug(
                    name: .debug,
                    settings: SettingsDictionary()
                ),
                .release(
                    name: .release,
                    settings: SettingsDictionary()
                        .bitcodeEnabled(true)
                        .swiftCompilationMode(.wholemodule)
                )
            ])
        )
    }

    static func makeFramework(
        name: String,
        sources: ProjectDescription.SourceFilesList,
        dependencies: [ProjectDescription.TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = []
    ) -> Target {
        Target(
            name: name,
            platform: .iOS,
            product: defaultPackageType,
            bundleId: makeBundleID(with: name + ".framework"),
            deploymentTarget: .iOS(targetVersion: targetVersion, devices: .iphone),
            sources: sources,
            resources: resources,
            scripts: targetScripts,
            dependencies: dependencies
        )
    }

    private static func feature(
        implementation featureName: String,
        dependencies: [ProjectDescription.TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = []
    ) -> Target {
        .makeFramework(
            name: featureName,
            sources: [ "Sources/**" ],
            dependencies: dependencies,
            resources: resources
        )
    }

    static func feature(
        implementation featureName: Feature,
        dependencies: [ProjectDescription.TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = []
    ) -> Target {
        .feature(
            implementation: featureName.rawValue,
            dependencies: dependencies,
            resources: resources
        )
    }
}
