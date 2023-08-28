import Combine
import Foundation

public protocol IntentType: AnyObject {
    associatedtype ViewAction

    func send(action: ViewAction)
    func send(action: ViewAction, viewEffect: (() -> Void)?)
    func mutate(action: ViewAction, viewEffect: (() -> Void)?)
}

public extension IntentType {
    func send(action: ViewAction) {
        mutate(action: action, viewEffect: .none)
    }

    func send(action: ViewAction, viewEffect: (() -> Void)?) {
        mutate(action: action, viewEffect: viewEffect)
    }
}

public protocol IntentBindingType {
    associatedtype IntentType
    associatedtype Model

    var container: Container<IntentType, Model> { get }
    var intent: IntentType { get }
    var model: Model { get }
}
