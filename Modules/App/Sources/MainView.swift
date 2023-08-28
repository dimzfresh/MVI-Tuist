import FeatureAuthorization
import SwiftUI

struct MainView: View {

    var body: some View {
        VStack {
            UsersView.build(data: .init(title: "Users"))
        }
        .ignoresSafeArea()
        .onOpenURL { _ in }
    }
}
