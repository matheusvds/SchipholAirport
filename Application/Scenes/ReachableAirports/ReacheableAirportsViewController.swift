import Foundation
import UIKit

protocol ReacheableAirportsDisplayLogic: AnyObject {
    
}

final class ReacheableAirportsViewController: UIViewController {
    
    private let interactor: ReacheableAirportsBusinessLogic
    let router: ReacheableAirportsRouterLogic
    
    init(interactor: ReacheableAirportsBusinessLogic, router: ReacheableAirportsRouterLogic) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        title = "Airports"
    }
    
}

extension ReacheableAirportsViewController: ReacheableAirportsDisplayLogic {
    
}



