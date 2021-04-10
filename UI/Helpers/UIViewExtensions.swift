import Foundation
import UIKit

extension UIView {
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let size = CGSize(width: radius, height: radius)
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: size)
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    func emptyView(heightenBy height: CGFloat) -> UIView {
        let frame = CGRect(origin: .zero, size: CGSize(width: UIScreen.main.bounds.width, height: height))
        return UIView(frame: frame)
    }
}

extension UITableViewCell: Identifiable { }
