//
//  CardView.swift
//  CustomApp
//
//  Created by Jeremy Gonsalves on 2024-09-28.
//

import SwiftUI

import Foundation

// MARK: - Card View Model

/// ViewModel for handling the swipeable card view that displays deals.
class CardViewModel: ObservableObject {
    
    /// The list of deals to display in the swipeable card view.
    @Published var deals: [Deal] = []
    
    /// Fetch deals from a data source (API, local file, etc.).
    func fetchDeals() {
        // This is where you'd call an API or a local data source to get the deals.
        // For now, we're just adding mock data.
        let mockDeals = [
            Deal(id: UUID().uuidString,
                 productName: "Apple",
                 price: 0.99,
                 imageUrl: "https://example.com/apple.jpg",
                 storeLocation: "Store A",
                 expirationDate: Date().addingTimeInterval(86400),
                 description: "Fresh red apples at a discounted price!"),
            
            Deal(id: UUID().uuidString,
                 productName: "Banana",
                 price: 0.59,
                 imageUrl: "https://example.com/banana.jpg",
                 storeLocation: "Store B",
                 expirationDate: nil,
                 description: "Delicious ripe bananas."),
            
            // Add more mock deals here...
        ]
        
        // Assign the mock deals to the published `deals` property
        self.deals = mockDeals
    }
    
    /// Remove a deal from the list once it has been swiped or dismissed.
    func removeDeal(_ deal: Deal) {
        deals.removeAll { $0.id == deal.id }
    }
}
