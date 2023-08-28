import SwiftUI
import Combine

public struct RouterCloseModifier: ViewModifier {

    public let publisher: AnyPublisher<Void, Never>

    @Environment(\.presentationMode) private var presentationMode

    public func body(content: Content) -> some View {
        content.onReceive(publisher) { _ in
            presentationMode.wrappedValue.dismiss()
        }
    }
}
