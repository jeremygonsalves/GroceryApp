//
//  UserInfoView.swift
//  CustomApp
//
//  Created by Jeremy Gonsalves on 2024-09-28.
//
import SwiftUI
import Combine  // Add this to use AnyCancellable and Combine framework

// MARK: - Search View Model

/// ViewModel for handling search functionality for deals.
class SearchViewModel: ObservableObject {
    
    /// The full list of deals.
    var allDeals: [Deal] = []
    
    /// The current search query.
    @Published var searchQuery: String = ""
    
    /// The list of filtered deals based on the search query.
    @Published var filteredDeals: [Deal] = []
    
    private var cancellables = Set<AnyCancellable>()  // Collection to store subscriptions
    
    init(deals: [Deal]) {
        self.allDeals = deals
        self.filteredDeals = deals // Show all deals by default.
        
        // Start listening for changes in the search query.
        $searchQuery
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .sink { [weak self] query in
                self?.filterDeals(query: query)
            }
            .store(in: &cancellables)
    }
    
    /// Filter deals based on the search query.
    private func filterDeals(query: String) {
        if query.isEmpty {
            filteredDeals = allDeals
        } else {
            filteredDeals = allDeals.filter {
                $0.productName.lowercased().contains(query.lowercased())
            }
        }
    }
}
