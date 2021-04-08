import Foundation
import UIKit

protocol ReachableAirportsDisplayLogic: AnyObject {
    func displayClosestsAirports(viewModel: ReachableAirports.GetAirports.ViewModel)
}

final class ReachableAirportsViewController: UIViewController {
    
    private let interactor: ReachableAirportsBusinessLogic
    let router: ReachableAirportsRouterLogic
    
    init(interactor: ReachableAirportsBusinessLogic, router: ReachableAirportsRouterLogic) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        start()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        title = "Airports"
    }
    
    private func start() {
        interactor.fetchClosestsAirports(request: ReachableAirports.GetAirports.Request())
    }
    
}

extension ReachableAirportsViewController: ReachableAirportsDisplayLogic {
    
    func displayClosestsAirports(viewModel: ReachableAirports.GetAirports.ViewModel) {
        print(viewModel)
    }
    
}



