import Common
import SwiftUI

public struct UsersRouter: Router {
    public typealias RouterScreenType = ScreenType
    public typealias RouterAlertType = AlertScreen

    public let subjects: Subjects
    public let intent: UsersIntentType
}

extension UsersRouter {
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
        case let .detail(title):
            NavigationView {
                Text(title)
            }
        }
    }
    public func onDismiss(screenType: RouterScreenType) {}
}

extension UsersRouter {
    public enum AlertScreen: RouterAlertScreenProtocol {
        case defaultAlert(title: String, message: String?)
    }

    public func makeAlert(type: RouterAlertType) -> Alert {
        switch type {
        case let .defaultAlert(title, message):
            return Alert(title: Text(title),
                         message: message.map { Text($0) },
                         dismissButton: .cancel())
        }
    }
}
