import Combine
import Common

public protocol ___VARIABLE_sceneName___ModelState {
    var title: String { get }
    var viewState: ___VARIABLE_sceneName___Types.Model.ViewState { get }
}

public protocol ___VARIABLE_sceneName___ModelActions: AnyObject {
    func setupScreen(title: String)
    func updateContent(names: [String])
    func showError(_ error: Error)
}

public final class ___VARIABLE_sceneName___Model: ObservableObject, ___VARIABLE_sceneName___ModelState {
    @Published public private(set) var viewState: ___VARIABLE_sceneName___Types.Model.ViewState = .loading
    @Published public private(set) var title = ""
}

extension ___VARIABLE_sceneName___Model: ___VARIABLE_sceneName___ModelActions {
    public func setupScreen(title: String) {
        self.title = title
    }

    public func updateContent(names: [String]) {
        viewState = .content(names: [])
    }

    public func showError(_ error: Error) {
        viewState = .error(text: error.localizedDescription)
    }
}
