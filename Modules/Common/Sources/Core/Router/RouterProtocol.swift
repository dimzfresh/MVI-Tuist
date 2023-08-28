import Combine
import SwiftUI

// swiftlint:disable all
public struct RouterSubjects<ScreenType, AlertType> where ScreenType: RouterScreenProtocol, AlertType: RouterAlertScreenProtocol {
    public let screen = PassthroughSubject<ScreenType, Never>()
    public let alert = PassthroughSubject<AlertType, Never>()
    public let close = PassthroughSubject<Void, Never>()

    public init() {}
}

public protocol Router: ViewModifier {

    associatedtype RouterScreenType: RouterScreenProtocol
    associatedtype RouterAlertType: RouterAlertScreenProtocol
    associatedtype RouterScreen: View

    var subjects: Subjects { get }

    func makeScreen(type: RouterScreenType) -> RouterScreen
    func makeAlert(type: RouterAlertType) -> Alert
    func onDismiss(screenType: RouterScreenType)
}

extension Router {
    public typealias Subjects = RouterSubjects<RouterScreenType, RouterAlertType>

    public func body(content: Content) -> some View {
        content
            .modifier(RouterNavigationViewModifier(
                publisher: subjects.screen.filter { $0.routeType == .navigationLink }.eraseToAnyPublisher(),
                screen: makeScreen,
                onDismiss: onDismiss))
            .modifier(RouterNavigationStackModifier(
                    publisher: subjects.screen.filter { $0.routeType == .navigationDestination }.eraseToAnyPublisher(),
                    screen: makeScreen,
                    onDismiss: onDismiss))
            .modifier(RouterAlertModifier(
                publisher: subjects.alert.eraseToAnyPublisher(),
                alert: makeAlert))
            .modifier(RouterCloseModifier(
                publisher: subjects.close.eraseToAnyPublisher()))
            .modifier(RouterSheetModifier(
                isFullScreenCover: false,
                publisher: subjects.screen.filter { $0.routeType == .sheet }.eraseToAnyPublisher(),
                screen: makeScreen,
                onDismiss: onDismiss))
            .modifier(RouterSheetModifier(
                isFullScreenCover: true,
                publisher: subjects.screen.filter { $0.routeType == .fullScreenCover }.eraseToAnyPublisher(),
                screen: makeScreen,
                onDismiss: onDismiss))
    }

    public func onDismiss(screenType: RouterScreenType) {}
}
// swiftlint:disable all
