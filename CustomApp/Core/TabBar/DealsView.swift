import SwiftUI

// MARK: - Deals View
struct DealsView: View {
    @State private var showingDetail = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Deals View")
                    .font(.largeTitle)
                    .padding()
                
                Button("Show Deal Details") {
                    showingDetail = true
                }
                .sheet(isPresented: $showingDetail) {
                    DealDetailView()  // Placeholder for detailed deal view
                }
            }
            .navigationTitle("Deals")
        }
    }
}

struct DealDetailView: View {
    var body: some View {
        Text("Deal Details")
            .font(.title)
    }
}

struct DealsView_Previews: PreviewProvider {
    static var previews: some View {
        DealsView()
    }
}
