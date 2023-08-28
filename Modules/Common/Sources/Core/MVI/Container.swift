import SwiftUI
import Combine

public final class Container<Intent, Model>: ObservableObject {

    public let intent: Intent
    public let model: Model

    private var subscriptions = Set<AnyCancellable>()

    public init(
        intent: Intent,
        model: Model,
        modelChangePublisher: ObjectWillChangePublisher
    ) {
        self.intent = intent
        self.model = model

        modelChangePublisher
            .receive(on: RunLoop.main)
            .sink(receiveValue: objectWillChange.send)
            .store(in: &subscriptions)
    }
}
