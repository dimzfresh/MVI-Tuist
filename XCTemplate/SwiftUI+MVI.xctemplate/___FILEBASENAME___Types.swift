public enum ___VARIABLE_sceneName___Types {
    public enum Intent {}
    public enum Model {}
}

extension ___VARIABLE_sceneName___Types.Intent {
    public struct ExternalData {
        public let title: String

        public init(title: String) {
            self.title = title
        }
    }
}

extension ___VARIABLE_sceneName___Types.Model {
    public enum ViewAction: Equatable {
        case onAppear
        case onDisappear
        case onTapNext
    }

    public enum ViewState: Equatable {
        case loading
        case content(names: [String])
        case error(text: String)
    }
}
