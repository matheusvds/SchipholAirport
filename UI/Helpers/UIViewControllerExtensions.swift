import Foundation
import UIKit

extension UIViewController {
    
    /// Presents a loading for any UIViewController
    func presentLoading() {

        let loadingIndicator = UIActivityIndicatorView(
            frame: CGRect(x: 10, y: 5, width: 50, height: 50)
        )
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating()

        let alert = UIAlertController(
            title: nil,
            message: NSLocalizedString("please_wait", comment: "waiting message"),
            preferredStyle: .alert
        )
        alert.view.addSubview(loadingIndicator)
        
        DispatchQueue.main.async { [weak self] in
            self?.present(alert, animated: true, completion: nil)
        }
    }
    
    /// Dismiss the presented view for any UIViewController
    /// Used to dismissLoading
    func dismissLoading(completion: (() -> Void)? = nil) {
        DispatchQueue.main.async { [weak self] in
            self?.dismiss(animated: true, completion: completion)
        }
    }
}
