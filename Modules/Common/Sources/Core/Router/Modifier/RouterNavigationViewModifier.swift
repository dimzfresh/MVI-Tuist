import SwiftUI
import Combine

// swiftlint:disable all
public protocol RouterNavigationViewScreenProtocol {}

public struct RouterNavigationViewModifier<Screen, ScreenType> where Screen: View, ScreenType: RouterNavigationViewScreenProtocol {

    public let publisher: AnyPublisher<ScreenType, Never>
    public var screen: (ScreenType) -> Screen
    public let onDismiss: ((ScreenType) -> Void)?

    @State private var screenType: ScreenType?
}

extension RouterNavigationViewModifier: ViewModifier {
    public func body(content: Content) -> some View {
        ZStack {
            NavigationLink(
                "",
                isActive: Binding<Bool>(
                    get: { screenType != nil },
                    set: {
                        if !$0 {
                            if let type = screenType { onDismiss?(type) }
                            screenType = nil
                        }
                    }),
                destination: {
                    if let type = screenType {
                        screen(type)
                    } else {
                        EmptyView()
                    }
                })

            content
        }
        .onReceive(publisher) { screenType = $0 }
    }
}
// swiftlint:disable all
