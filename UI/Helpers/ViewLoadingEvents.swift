import Foundation
import UIKit

public protocol ViewLoadingEvents {
    func startLoading(at viewController: UIViewController)
    func stopLoading(at viewController: UIViewController, completion: (() -> Void)?)
}

extension ViewLoadingEvents {
    
    public func startLoading(at viewController: UIViewController) {
        viewController.presentLoading()
    }
    
    public func stopLoading(at viewController: UIViewController, completion: (() -> Void)? = nil) {
        viewController.dismissLoading(completion: completion)
    }
}
