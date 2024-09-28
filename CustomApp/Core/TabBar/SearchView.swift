import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    @State private var deals: [Deal] = [
        Deal(id: "1", productName: "Apples", price: 1.99, imageUrl: "https://example.com/apples.jpg", storeLocation: "Store A", expirationDate: nil, description: "Fresh apples"),
        Deal(id: "2", productName: "Bananas", price: 0.99, imageUrl: "https://example.com/bananas.jpg", storeLocation: "Store B", expirationDate: nil, description: "Ripe bananas")
    ]
    
    var filteredDeals: [Deal] {
        if searchText.isEmpty {
            return deals
        } else {
            return deals.filter { $0.productName.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        VStack {
            SearchBar(searchText: $searchText)
            List(filteredDeals) { deal in
                Text(deal.productName)
            }
        }
        .navigationTitle("Search")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
