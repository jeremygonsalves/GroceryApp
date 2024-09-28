//
//  MainTabView.swift
//  CustomApp
//
//  Created by Jeremy Gonsalves on 2024-09-28.
//

import SwiftUI

struct MainTabView: View {
    
    var body: some View {
        TabView {
            // Shopping Deals Tab
            DealsView()
                .tabItem {
                    Image(systemName: "tag")
                    Text("Deals")
                }
                .tag(0)
            
            // Search Tab
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .tag(1)
            
            // Cart Tab
            CartView()
                .tabItem {
                    Image(systemName: "cart")
                    Text("Cart")
                }
                .tag(2)
            
            // Profile Tab
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
                .tag(3)
        }
        .accentColor(.primary)  // Automatically adapts to light/dark mode
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
