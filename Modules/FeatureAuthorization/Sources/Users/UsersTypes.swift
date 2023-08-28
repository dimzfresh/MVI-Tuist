public enum UsersTypes {
    public enum Intent {}
    public enum Model {}
}

extension UsersTypes.Intent {
    public struct ExternalData {
        public let title: String

        public init(title: String) {
            self.title = title
        }
    }
}

extension UsersTypes.Model {
    public enum ViewAction: Equatable {
        case onAppear
        case onDisappear
        case onTapNext
    }

    public enum ViewState: Equatable {
        case loading
        case content(names: [UsersItemView.Model])
        case error(text: String)
    }
}
