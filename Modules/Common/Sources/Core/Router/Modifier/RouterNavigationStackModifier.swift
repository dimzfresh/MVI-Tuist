import SwiftUI
import Combine

// swiftlint:disable all
public protocol RouterNavigationStackScreenProtocol {}

public struct RouterNavigationStackModifier<Screen, ScreenType> where Screen: View, ScreenType: RouterNavigationStackScreenProtocol {

    public let publisher: AnyPublisher<ScreenType, Never>
    public var screen: (ScreenType) -> Screen
    public let onDismiss: ((ScreenType) -> Void)?

    @State private var screenType: ScreenType?
}

extension RouterNavigationStackModifier: ViewModifier {
    public func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .navigationDestination(isPresented: Binding<Bool>(
                    get: { screenType != nil },
                    set: {
                        if !$0 {
                            if let type = screenType { onDismiss?(type) }
                            screenType = nil
                        }
                    }), destination: {
                        if let type = screenType {
                            screen(type)
                        } else {
                            EmptyView()
                        }
                    }
                ).onReceive(publisher) { screenType = $0 }
        } else {
            content
        }
    }
}
// swiftlint:disable all
