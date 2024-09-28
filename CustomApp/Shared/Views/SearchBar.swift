import SwiftUI

// MARK: - Search Bar
struct SearchBar: View {
    @Binding var searchText: String  // Bind to the parent view's search text
    @State private var isEditing = false  // State to track if the user is currently typing

    var body: some View {
        HStack {
            // TextField for search input
            TextField("Search...", text: $searchText)
                .padding(10)
                .padding(.horizontal, 35)
                .background(Color(.systemGray6))  // Light gray background for the text field
                .cornerRadius(8)
                .overlay(
                    HStack {
                        // Search icon in the text field
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        // Clear button when the user is typing
                        if isEditing {
                            Button(action: {
                                self.searchText = ""  // Clear the search text
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .onTapGesture {
                    self.isEditing = true
                }

            // Cancel button to exit search mode
            if isEditing {
                Button("Cancel") {
                    self.isEditing = false
                    self.searchText = ""  // Clear the search text
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)  // Dismiss the keyboard
                }
                .padding(.trailing, 8)
                .transition(.move(edge: .trailing))
                //.animation(.default)
            }
        }
        .padding(.horizontal)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""))
    }
}
