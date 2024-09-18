//
//  Product.swift
//  CustomApp
//
//  Created by Jeremy Gonsalves on 2024-09-28.
//

import Foundation

// MARK: - Product Model

/// A struct representing a product, with details like name, category, and price.
struct Product: Identifiable {
    
    /// A unique identifier for the product.
    let id: String
    
    /// The name of the product.
    let name: String
    
    /// The category the product belongs to (e.g., Fruits, Vegetables, Dairy).
    let category: String
    
    /// The price of the product.
    let price: Double
    
    /// The URL for an image representing the product.
    let imageUrl: String
    
    /// A short description or additional details about the product.
    let description: String?
    
    /// A computed property to format the price as a string (e.g., "$10.99").
    var formattedPrice: String {
        return String(format: "$%.2f", price)
    }
    
    /// Example method to check if a product is in a specific category.
    func isInCategory(_ category: String) -> Bool {
        return self.category.lowercased() == category.lowercased()
    }
}
