//
//  Deal.swift
//  CustomApp
//
//  Created by Jeremy Gonsalves on 2024-09-28.
//
//this scirpt is meant to show the grocery deals well define the essential properties that the app needs to display a deal such as the product name, the price, image URL and anything else

import SwiftUI
import Foundation

// MARK: - Deal Model

/// A struct representing a grocery deal with details about the product, price, and store location.
struct Deal: Identifiable {
    
    /// A unique identifier for the deal.
    let id: String
    
    /// The name of the product being offered in the deal.
    let productName: String
    
    /// The price of the product in the deal.
    let price: Double
    
    /// The URL for an image representing the product.
    let imageUrl: String
    
    /// The location or store where the deal is available.
    let storeLocation: String
    
    /// The expiration date of the deal.
    let expirationDate: Date?
    
    /// A short description or additional details about the deal.
    let description: String?
    
    /// A computed property to format the price as a string (e.g., "$10.99").
    var formattedPrice: String {
        return String(format: "$%.2f", price)
    }
    
    /// A computed property to format the expiration date, if available.
    var formattedExpirationDate: String {
        guard let expirationDate = expirationDate else { return "No Expiration" }
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.medium  // Explicitly referencing the enum
        return formatter.string(from: expirationDate)
    }

    
    /// Check if the deal is still active based on the expiration date.
    var isActive: Bool {
        guard let expirationDate = expirationDate else { return true } // No expiration means it's always active.
        return Date() < expirationDate
    }
}

