import SwiftUI

// MARK: - User Info View
struct UserInfoView: View {
    var userName: String
    var userEmail: String
    var profileImage: Image?
    
    var body: some View {
        VStack(spacing: 16) {
            // Profile Image
            if let profileImage = profileImage {
                profileImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.primaryColor, lineWidth: 4)
                    )
                    .shadow(radius: 10)
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.gray)
                    .clipShape(Circle())
                    .shadow(radius: 10)
            }
            
            // User Name
            Text(userName)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primaryTextColor)
            
            // User Email
            Text(userEmail)
                .font(.subheadline)
                .foregroundColor(.secondaryTextColor)
            
            // Edit Profile Button
            Button(action: {
                // Add action for editing profile
                print("Edit profile tapped")
            }) {
                Text("Edit Profile")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView(
            userName: "John Doe",
            userEmail: "john.doe@example.com",
            profileImage: Image(systemName: "person.circle.fill")
        )
    }
}
