//
//  ShoppingList.swift
//  CustomApp
//
//  Created by Jeremy Gonsalves on 2024-09-28.
//

import Foundation

// MARK: - Shopping List Model

/// A class to manage the user's shopping list, containing deals and products.
class ShoppingList: ObservableObject {
    
    /// The items in the shopping list (could be deals or products).
    @Published var items: [ShoppingListItem] = []
    
    /// Add a deal to the shopping list.
    func addDeal(_ deal: Deal) {
        let item = ShoppingListItem(deal: deal)
        if !items.contains(where: { $0.id == item.id }) {
            items.append(item)
        }
    }
    
    /// Add a product to the shopping list.
    func addProduct(_ product: Product) {
        let item = ShoppingListItem(product: product)
        if !items.contains(where: { $0.id == item.id }) {
            items.append(item)
        }
    }
    
    /// Remove an item from the shopping list.
    func removeItem(_ item: ShoppingListItem) {
        items.removeAll { $0.id == item.id }
    }
    
    /// Compute the best route based on price, proximity, and efficiency.
    /// This is just a placeholder; you can customize the logic for route optimization.
    func computeBestRoute() -> [ShoppingListItem] {
        // Sort items by price, proximity, or any other criteria
        // For now, let's just return items sorted by price (lowest first).
        return items.sorted { $0.price < $1.price }
    }
    
    /// Calculate the total price of all items in the shopping list.
    var totalPrice: Double {
        return items.reduce(0) { $0 + $1.price }
    }
    
    /// Number of items in the shopping list.
    var itemCount: Int {
        return items.count
    }
}
