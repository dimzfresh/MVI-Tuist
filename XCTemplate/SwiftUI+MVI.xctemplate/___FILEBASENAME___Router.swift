import Common
import SwiftUI

public struct ___VARIABLE_sceneName___Router: Router {
    public typealias RouterScreenType = ScreenType
    public typealias RouterAlertType = AlertScreen

    public let subjects: Subjects
    public let intent: ___VARIABLE_sceneName___IntentType
}

extension ___VARIABLE_sceneName___Router {
    public enum ScreenType: RouterScreenProtocol {
        case detail(title: String)

        public var routeType: RouterScreenPresentationType {
            switch self {
            case .detail:
                return .navigationLink
            }
        }
    }

    @ViewBuilder
    public func makeScreen(type: RouterScreenType) -> some View {
        switch type {
        case .detail:
            EmptyView()
        }
    }

    public func onDismiss(screenType: RouterScreenType) {}
}

extension ___VARIABLE_sceneName___Router {
    public enum AlertScreen: RouterAlertScreenProtocol {
        case defaultAlert(title: String, message: String?)
    }

    public func makeAlert(type: RouterAlertType) -> Alert {
        switch type {
        case let .defaultAlert(title, message):
            return Alert(title: Text(title),
                         message: message.map { Text($0) },
                         dismissButton: .cancel(Text("Cancel")))
        }
    }
}
