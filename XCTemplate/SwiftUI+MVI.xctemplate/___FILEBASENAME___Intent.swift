import Common
import SwiftUI

public protocol ___VARIABLE_sceneName___IntentType {
    var router: ___VARIABLE_sceneName___Router.Subjects { get }

    func send(action: ___VARIABLE_sceneName___Types.Model.ViewAction)
}

public final class ___VARIABLE_sceneName___Intent {
    private weak var model: ___VARIABLE_sceneName___ModelActions?
    private let externalData: ___VARIABLE_sceneName___Types.Intent.ExternalData

    public private(set) var router = ___VARIABLE_sceneName___Router.Subjects()

    public init(
        model: ___VARIABLE_sceneName___ModelActions,
        externalData: ___VARIABLE_sceneName___Types.Intent.ExternalData
    ) {
        self.model = model
        self.externalData = externalData
    }
}

extension ___VARIABLE_sceneName___Intent: IntentType, ___VARIABLE_sceneName___IntentType {
    public func mutate(action: ___VARIABLE_sceneName___Types.Model.ViewAction, viewEffect: (() -> Void)?) {
        switch action {
        case .onAppear:
            ()
        case .onDisappear:
            ()
        case .onTapNext:
            router.screen.send(.detail(title: "Hi there!"))
        }
    }
}
