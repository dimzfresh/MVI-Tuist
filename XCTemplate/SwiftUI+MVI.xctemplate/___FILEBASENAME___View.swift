import Common
import SwiftUI

public struct ___VARIABLE_sceneName___View: IntentBindingType {

    @StateObject public var container: Container<___VARIABLE_sceneName___IntentType, ___VARIABLE_sceneName___ModelState>
    public var intent: ___VARIABLE_sceneName___IntentType { container.intent }
    public var model: ___VARIABLE_sceneName___ModelState { container.model }

    public static func build(data: ___VARIABLE_sceneName___Types.Intent.ExternalData) -> some View {
        let model = ___VARIABLE_sceneName___Model()
        let intent = ___VARIABLE_sceneName___Intent(model: model, externalData: data)
        let container = Container(
            intent: intent as ___VARIABLE_sceneName___IntentType,
            model: model as ___VARIABLE_sceneName___ModelState,
            modelChangePublisher: model.objectWillChange
        )
        let view = ___VARIABLE_sceneName___View(container: container)
        return view
    }
}

extension ___VARIABLE_sceneName___View: View {
    public var body: some View {
        NavigationView {
            ZStack {
                switch model.viewState {
                case .loading:
                    EmptyView()
                case let .content(names):
                    EmptyView()
                case let .error(text):
                    EmptyView()
                }
            }
            .onAppear { intent.send(action: .onAppear) }
            .onDisappear { intent.send(action: .onDisappear) }
            .navigationTitle(model.title)
            .modifier(___VARIABLE_sceneName___Router(subjects: intent.router, intent: intent))
            .onTapGesture {
                intent.send(action: .onTapNext)
            }
        }
    }
}

#if DEBUG
struct ___VARIABLE_sceneName___View_Previews: PreviewProvider {
    static var previews: some View {
        ___VARIABLE_sceneName___View.build(data: .init(title: ""))
    }
}
#endif
