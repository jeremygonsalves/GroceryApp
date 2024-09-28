import SwiftUI

// MARK: - Cart View
struct CartView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Cart View")
                    .font(.largeTitle)
                    .padding()
                
                Spacer()
            }
            .navigationTitle("Cart")
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
