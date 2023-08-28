import Combine
import Common
import SwiftUI

public protocol UsersModelState {
    var title: String { get }
    var viewState: UsersTypes.Model.ViewState { get }
}

public protocol UsersModelActions: AnyObject {
    func setupScreen(title: String)
    func updateContent(names: [String])
    func showError(_ error: Error)
}

public final class UsersModel: ObservableObject, UsersModelState {
    @Published public private(set) var viewState: UsersTypes.Model.ViewState = .loading
    @Published public private(set) var title = ""
}

extension UsersModel: UsersModelActions {
    public func setupScreen(title: String) {
        self.title = title
    }

    public func updateContent(names: [String]) {
        viewState = .content(names: names.map({ .init(id: UUID().uuidString, name: $0) }))
    }

    public func showError(_ error: Error) {
        viewState = .error(text: error.localizedDescription)
    }
}
