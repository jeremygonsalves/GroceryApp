import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            // Shopping Deals Tab
            NavigationView {
                DealsView()
            }
            .tabItem {
                Image(systemName: "tag")
                Text("Deals")
            }
            .tag(0)
            
            // Search Tab
            NavigationView {
                SearchView()
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }
            .tag(1)
            
            // Cart Tab
            NavigationView {
                CartView()
            }
            .tabItem {
                Image(systemName: "cart")
                Text("Cart")
            }
            .tag(2)
            
            // Profile Tab
            NavigationView {
                ProfileView()
            }
            .tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
            .tag(3)
        }
        .accentColor(.primary)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
