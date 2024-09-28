//
//  ShoppingListViewModel.swift
//  CustomApp
//
//  Created by Jeremy Gonsalves on 2024-09-28.
//

import SwiftUI

import Foundation

// MARK: - Shopping List View Model

/// ViewModel for managing the user's shopping list.
class ShoppingListViewModel: ObservableObject {
    
    /// The user's shopping list containing deals they've added.
    @Published var shoppingList: [Deal] = []
    
    /// Add a deal to the shopping list.
    func addToShoppingList(_ deal: Deal) {
        if !shoppingList.contains(where: { $0.id == deal.id }) {
            shoppingList.append(deal)
        }
    }
    
    /// Remove a deal from the shopping list.
    func removeFromShoppingList(_ deal: Deal) {
        shoppingList.removeAll { $0.id == deal.id }
    }
}
