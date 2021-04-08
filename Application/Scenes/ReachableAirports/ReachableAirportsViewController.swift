import Foundation
import UIKit
import UI

protocol ReachableAirportsDisplayLogic: AnyObject {
    func displayClosestsAirports(viewModel: ReachableAirports.GetAirports.ViewModel)
}

final class ReachableAirportsViewController: UIViewController {
    
    private let interactor: ReachableAirportsBusinessLogic
    let viewLogic: ReachableAirportsViewLogic
    let router: ReachableAirportsRouterLogic
    
    init(interactor: ReachableAirportsBusinessLogic, viewLogic: ReachableAirportsViewLogic, router: ReachableAirportsRouterLogic) {
        self.interactor = interactor
        self.viewLogic = viewLogic
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = viewLogic.view
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
        viewLogic.set(viewModel: viewModel)
    }
    
}



