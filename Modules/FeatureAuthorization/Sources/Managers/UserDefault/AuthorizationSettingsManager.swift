import Common

public struct AuthorizationSettingsManager {
    @UserDefault(key: .username, defaultValue: "")
    public var username: String
}

private struct AuthorizationSettingsManagerKey: InjectionKey {
    static var currentValue = AuthorizationSettingsManager()
}

extension InjectedValues {
    public var authorizationSettingsManager: AuthorizationSettingsManager {
        get { Self[AuthorizationSettingsManagerKey.self] }
        set { Self[AuthorizationSettingsManagerKey.self] = newValue }
    }
}
