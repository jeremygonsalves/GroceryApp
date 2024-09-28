import UIKit

// MARK: - UIView Extensions

extension UIView {
    
    /// Adds multiple subviews to a UIView at once.
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
    
    /// Rounds specific corners of a UIView with a given radius.
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    /// Adds a shadow to the UIView with customizable parameters.
    func addShadow(offset: CGSize = CGSize(width: 0, height: 2), radius: CGFloat = 4, opacity: Float = 0.5, color: UIColor = .black) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.masksToBounds = false
    }
    
    /// Adds a border with a specified color and width to the UIView.
    func addBorder(color: UIColor, width: CGFloat) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
    
    /// Animates a shake effect on the UIView (useful for error indications).
    func shake(duration: CFTimeInterval = 0.1, repeatCount: Float = 3, amplitude: CGFloat = 10) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = duration
        animation.repeatCount = repeatCount
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: center.x - amplitude, y: center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: center.x + amplitude, y: center.y))
        layer.add(animation, forKey: "shake")
    }
    
    /// Pins the view to its superview's edges (useful for programmatic auto-layout).
    func pinToSuperviewEdges(insets: UIEdgeInsets = .zero) {
        guard let superview = superview else {
            print("Superview is nil.")
            return
        }
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superview.topAnchor, constant: insets.top).isActive = true
        leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: insets.left).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -insets.right).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -insets.bottom).isActive = true
    }
    
    /// Applies a fade-in effect to the view.
    func fadeIn(duration: TimeInterval = 0.5, delay: TimeInterval = 0) {
        self.alpha = 0
        UIView.animate(withDuration: duration, delay: delay, options: .curveEaseIn, animations: {
            self.alpha = 1
        }, completion: nil)
    }
    
    /// Applies a fade-out effect to the view.
    func fadeOut(duration: TimeInterval = 0.5, delay: TimeInterval = 0) {
        UIView.animate(withDuration: duration, delay: delay, options: .curveEaseOut, animations: {
            self.alpha = 0
        }, completion: nil)
    }
}
