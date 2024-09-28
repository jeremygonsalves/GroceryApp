import SwiftUI

struct SwipeCardView: View {
    let deal: Deal
    let onSwipeRight: () -> Void
    let onSwipeLeft: () -> Void
    let onSwipeUp: () -> Void
    
    @State private var translation: CGSize = .zero
    
    var body: some View {
        VStack {
            Image(deal.imageUrl)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 200)
                .clipped()
            
            Text(deal.productName)
                .font(.headline)
                .padding(.top, 8)
            
            Text(deal.formattedPrice)
                .font(.subheadline)
                .padding(.bottom, 8)
        }
        .frame(width: 350, height: 400)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .offset(x: translation.width, y: translation.height)
        .rotationEffect(.degrees(Double(translation.width / 20)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    self.translation = gesture.translation
                }
                .onEnded { gesture in
                    if gesture.translation.width > 100 {
                        // Swipe right: Add to cart
                        onSwipeRight()
                    } else if gesture.translation.width < -100 {
                        // Swipe left: Dismiss deal
                        onSwipeLeft()
                    } else if gesture.translation.height < -100 {
                        // Swipe up: Add to shopping list
                        onSwipeUp()
                    }
                    self.translation = .zero
                }
        )
    }
}

struct SwipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        let deal = Deal(id: "1", productName: "Sample Deal", price: 9.99, imageUrl: "https://example.com/sample.jpg", storeLocation: "Store A", expirationDate: nil, description: "Sample Description")
        SwipeCardView(deal: deal, onSwipeRight: {}, onSwipeLeft: {}, onSwipeUp: {})
    }
}
