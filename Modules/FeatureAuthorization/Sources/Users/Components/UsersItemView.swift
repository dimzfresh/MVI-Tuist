import SwiftUI

public struct UsersItemView: View {

    public struct Model: Hashable {
        let id: String
        let name: String
    }

    @State var model: Model
    public var didTap: (_ id: String) -> Void

    public var body: some View {
        Button(action: { didTap(model.id) }, label: {
            ZStack {
                Color(.sRGB, red: 250/255, green: 250/255, blue: 254/255, opacity: 1)
                    .cornerRadius(14)
                    .shadow(color: Color(.sRGB, white: 0, opacity: 0.15),
                            radius: 4, x: 1, y: 1)

                Text(model.name)
                    .foregroundColor(.black)
                    .padding()
            }
        })
    }
}
