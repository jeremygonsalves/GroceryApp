import SwiftUI

// MARK: - Color Extension for Custom App Colors

extension Color {
    
    // MARK: - Primary and Secondary Colors
    static let primaryColor = Color("PrimaryColor")  // Define these in Assets.xcassets
    static let secondaryColor = Color("SecondaryColor")
    
    // MARK: - Background Colors
    static let lightBackground = Color("LightBackground")  // Light mode background color
    static let darkBackground = Color("DarkBackground")    // Dark mode background color

    // MARK: - Text Colors
    static let primaryTextColor = Color("PrimaryTextColor")  // Main text color
    static let secondaryTextColor = Color("SecondaryTextColor")  // Subtext color

    // MARK: - Accent Colors
    static let accentColor = Color("AccentColor")  // Custom accent color

    // MARK: - Utility Colors
    static let successColor = Color("SuccessColor")  // Success green color
    static let warningColor = Color("WarningColor")  // Warning yellow color
    static let errorColor = Color("ErrorColor")      // Error red color

    // MARK: - Adaptive Colors for Light/Dark Mode
    static var adaptiveBackground: Color {
        Color(UIColor { traitCollection in
            return traitCollection.userInterfaceStyle == .dark ? UIColor(named: "DarkBackground")! : UIColor(named: "LightBackground")!
        })
    }
}
