import ProjectDescription

public enum Feature: String, CaseIterable {
    case app = "App"
    case appUIKit = "AppUIKit"
    case common = "Common"
    case authorization = "FeatureAuthorization"
    case feed = "FeatureFeed"
    case activity = "FeatureActivity"
    case add = "FeatureAdd"
    case new = "FeatureNew"
    case subscriptions = "FeatureSubscriptions"
}

public enum External: String {
    case snapKit = "SnapKit"
    case kingfisher = "Kingfisher"
}

public let rootPath = "Modules/"

public extension ProjectDescription.TargetDependency {
    private static func feature(target: String, featureName: String) -> ProjectDescription.TargetDependency {
        .project(target: target, path: .relativeToRoot(rootPath + featureName))
    }

    private static func feature(implementation moduleName: String) -> ProjectDescription.TargetDependency {
        .feature(target: moduleName, featureName: moduleName)
    }

    static func feature(implementation moduleName: Feature) -> ProjectDescription.TargetDependency {
        .feature(implementation: moduleName.rawValue)
    }

    static func external(_ module: External) -> ProjectDescription.TargetDependency {
        .external(name: module.rawValue)
    }

    static var common: ProjectDescription.TargetDependency {
        .feature(implementation: .common)
    }

    static var appUIKit: ProjectDescription.TargetDependency {
        .feature(implementation: .appUIKit)
    }
}
