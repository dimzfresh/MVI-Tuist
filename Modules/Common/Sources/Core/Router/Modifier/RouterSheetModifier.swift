import SwiftUI
import Combine

public protocol RouterSheetScreenProtocol {}

public struct RouterSheetModifier<Screen, ScreenType> where Screen: View, ScreenType: RouterSheetScreenProtocol {

    public var isFullScreenCover: Bool = false
    public let publisher: AnyPublisher<ScreenType, Never>
    public var screen: (ScreenType) -> Screen
    public let onDismiss: ((ScreenType) -> Void)?

    @State private var screenType: ScreenType?
}

extension RouterSheetModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .onReceive(publisher) { screenType = $0 }
            .if(!isFullScreenCover) { view in
                view.sheet(
                    isPresented: Binding<Bool>(
                        get: { screenType != nil },
                        set: {
                            if !$0 {
                                if let type = screenType { onDismiss?(type) }
                                screenType = nil
                            }
                        }),
                    content: {
                        if let type = screenType {
                            screen(type)
                        } else {
                            EmptyView()
                        }
                    })
            }
            .if(isFullScreenCover) { view in
                view.fullScreenCover(
                    isPresented: Binding<Bool>(
                        get: { screenType != nil },
                        set: {
                            if !$0 {
                                if let type = screenType { onDismiss?(type) }
                                screenType = nil
                            }
                        }),
                    content: {
                        if let type = screenType {
                            screen(type)
                        } else {
                            EmptyView()
                        }
                    }
                )
            }

    }
}

private extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
