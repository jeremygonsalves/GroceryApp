import SwiftUI

struct DealsView: View {
    @State private var deals: [Deal] = [
        Deal(id: "1", productName: "Apples", price: 1.99, imageUrl: "https://example.com/apples.jpg", storeLocation: "Store A", expirationDate: nil, description: "Fresh apples"),
        Deal(id: "2", productName: "Bananas", price: 0.99, imageUrl: "https://example.com/bananas.jpg", storeLocation: "Store B", expirationDate: nil, description: "Ripe bananas")
        // Add more mock deals here
    ]
    
    @State private var cart: [Deal] = []
    @State private var shoppingList: [Deal] = []
    
    var body: some View {
        VStack {
            if let deal = deals.first {
                SwipeCardView(deal: deal,
                              onSwipeRight: {
                                  addToCart(deal: deal)
                                  removeDeal(deal: deal)
                              },
                              onSwipeLeft: {
                                  removeDeal(deal: deal)
                              },
                              onSwipeUp: {
                                  addToShoppingList(deal: deal)
                                  removeDeal(deal: deal)
                              })
            } else {
                Text("No more deals")
            }
        }
    }
    
    func addToCart(deal: Deal) {
        cart.append(deal)
        print("Added to cart: \(deal.productName)")
    }
    
    func addToShoppingList(deal: Deal) {
        shoppingList.append(deal)
        print("Added to shopping list: \(deal.productName)")
    }
    
    func removeDeal(deal: Deal) {
        deals.removeAll { $0.id == deal.id }
    }
}

struct DealsView_Previews: PreviewProvider {
    static var previews: some View {
        DealsView()
    }
}
