import Common
import SwiftUI

public protocol UsersIntentType {
    var router: UsersRouter.Subjects { get }

    func send(action: UsersTypes.Model.ViewAction)
}

public final class UsersIntent {
    private weak var model: UsersModelActions?
    private let externalData: UsersTypes.Intent.ExternalData

    public private(set) var router = UsersRouter.Subjects()

    @Injected(\.networkManager) private var networkManager: Networking
    @Injected(\.appSettingsManager) private var appSettingsManager: AppSettingsManager
    @Injected(\.authorizationSettingsManager) private var authorizationSettingsManager: AuthorizationSettingsManager

    init(
        model: UsersModelActions,
        externalData: UsersTypes.Intent.ExternalData
    ) {
        self.model = model
        self.externalData = externalData
    }
}

extension UsersIntent: IntentType, UsersIntentType {
    public func mutate(action: UsersTypes.Model.ViewAction, viewEffect: (() -> Void)?) {
        switch action {
        case .onAppear:
            viewOnAppear()
            fetchUsers()
        case .onDisappear:
            viewOnDisappear()
        case .onTapNext:
            router.screen.send(.detail(title: "Hi there!"))
        }
    }

    private func viewOnAppear() {
        appSettingsManager.isFirstLauch = false
        authorizationSettingsManager.username = ""
        model?.setupScreen(title: externalData.title)
    }

    public func viewOnDisappear() {}

    private func fetchUsers() {
        Task(priority: .userInitiated) { @MainActor [weak self] in
            do {
                let request = API.users("kean").repos.get
                let repos: [Repo] = try await self?.networkManager.send(request).value ?? []
                self?.model?.updateContent(names: repos.map(\.name))
            } catch {
                self?.model?.showError(error)
            }
        }
    }
}
