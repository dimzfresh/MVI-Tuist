import SwiftUI
import Common

public struct UsersView: IntentBindingType {
    @StateObject public var container: Container<UsersIntentType, UsersModelState>
    public var intent: UsersIntentType { container.intent }
    public var model: UsersModelState { container.model }

    public static func build(data: UsersTypes.Intent.ExternalData) -> some View {
        let model = UsersModel()
        let intent = UsersIntent(model: model, externalData: data)
        let container = Container(
            intent: intent as UsersIntentType,
            model: model as UsersModelState,
            modelChangePublisher: model.objectWillChange
        )
        let view = UsersView(container: container)
        return view
    }
}

extension UsersView: View {
    public var body: some View {
        NavigationView {
            ZStack {
                switch model.viewState {
                case .loading:
                    LoadingContent()
                case let .content(names):
                    ListItems(intent: intent, names: names)
                case let .error(text):
                    ErrorContent(text: text)
                }
            }
            .onAppear { intent.send(action: .onAppear) }
            .onDisappear { intent.send(action: .onAppear) }
            .navigationTitle(model.title)
            .modifier(UsersRouter(subjects: intent.router, intent: intent))
            .onTapGesture {
                intent.send(action: .onTapNext)
            }
        }
    }
}

private extension UsersView {
    private struct LoadingContent: View {
        var body: some View {
            ZStack {
                Color.white
                ProgressView()
            }
        }
    }

    private struct ListItems: View {
        let intent: UsersIntentType
        let names: [UsersItemView.Model]

        var body: some View {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(names, id: \.self) {
                        UsersItemView(model: $0, didTap: { id in
                            //intent.onTap
                        })
                        .padding(.horizontal)
                    }
                }.padding(.vertical)
            }
        }
    }

    private struct ErrorContent: View {
        let text: String

        var body: some View {
            ZStack {
                Color.white
                Text(text)
            }
        }
    }
}

#if DEBUG
struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView.build(data: .init(title: "Users"))
    }
}
#endif
