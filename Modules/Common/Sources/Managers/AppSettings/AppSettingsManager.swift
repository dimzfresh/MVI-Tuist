import Foundation

public struct AppSettingsManager {
    @UserDefault(key: .isFirstLaunch, defaultValue: true)
    public var isFirstLauch: Bool

    @UserDefault(key: .isAuthorized, defaultValue: false)
    public var isAuthorized: Bool

    @UserDefault(key: .isOnboardingShown, defaultValue: false)
    public var isOnboardingShown: Bool
}

private struct AppSettingsManagerKey: InjectionKey {
    static var currentValue = AppSettingsManager()
}

extension InjectedValues {
    public var appSettingsManager: AppSettingsManager {
        get { Self[AppSettingsManagerKey.self] }
        set { Self[AppSettingsManagerKey.self] = newValue }
    }
}

extension UserDefaultKey {
    static let isFirstLaunch: UserDefaultKey = "first_launch_key"
    static let isAuthorized: UserDefaultKey = "authorized_key"
    static let isOnboardingShown: UserDefaultKey = "onboarding_shown_key"
}
