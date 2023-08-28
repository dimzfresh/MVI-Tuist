import SwiftUI
import Combine

public protocol RouterAlertScreenProtocol {}

public struct RouterAlertModifier<ScreenType> where ScreenType: RouterAlertScreenProtocol {

    public let publisher: AnyPublisher<ScreenType, Never>
    public let alert: (ScreenType) -> Alert

    @State private var screenType: ScreenType?
}

extension RouterAlertModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .onReceive(publisher) { screenType = $0 }
            .alert(
                isPresented: .init(get: { screenType != nil }, set: { if !$0 { screenType = nil } }),
                content: {
                    if let type = screenType {
                        return alert(type)
                    } else {
                        return Alert(title: Text("Something went wrong"),
                                     message: nil,
                                     dismissButton: .cancel())
                    }
                }
            )
    }
}
