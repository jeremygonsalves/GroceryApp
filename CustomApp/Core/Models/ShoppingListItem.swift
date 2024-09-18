//
//  ShoppingListItem.swift
//  CustomApp
//
//  Created by Jeremy Gonsalves on 2024-09-28.
//

import SwiftUI

import Foundation

// MARK: - Shopping List Item Model

/// A struct to represent an item in the shopping list. This can be either a Deal or a Product.
struct ShoppingListItem: Identifiable {
    
    /// The unique ID of the shopping list item (derived from the deal or product).
    let id: String
    
    /// The name of the item (could be the product name or deal product name).
    let name: String
    
    /// The price of the item.
    let price: Double
    
    /// The store or location of the item (if applicable).
    let storeLocation: String?
    
    /// Optional description or details about the item.
    let description: String?
    
    /// Whether the item is a deal (or just a regular product).
    let isDeal: Bool
    
    /// Create a shopping list item from a Deal.
    init(deal: Deal) {
        self.id = deal.id
        self.name = deal.productName
        self.price = deal.price
        self.storeLocation = deal.storeLocation
        self.description = deal.description
        self.isDeal = true
    }
    
    /// Create a shopping list item from a Product.
    init(product: Product) {
        self.id = product.id
        self.name = product.name
        self.price = product.price
        self.storeLocation = nil
        self.description = product.description
        self.isDeal = false
    }
}
