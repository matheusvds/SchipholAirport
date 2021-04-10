import Foundation
import UIKit
import UI

protocol AirportsMapDisplayLogic: AnyObject {
    func displayFetchedAirports(viewModel: AirportsMap.GetAirports.ViewModel)
}

final class AirportsMapViewController: UIViewController {
    
    private let interactor: AirportsMapBusinessLogic
    let viewLogic: AirportsMapViewLogic
    let router: AirportsMapRouterLogic
    
    // MARK: - Lifecycle
    init(interactor: AirportsMapBusinessLogic, viewLogic: AirportsMapViewLogic, router: AirportsMapRouterLogic) {
        self.interactor = interactor
        self.viewLogic = viewLogic
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = viewLogic.view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
    }
    
    private func start() {
        viewLogic.startLoading(at: self)
        interactor.fetchAirports(request: AirportsMap.GetAirports.Request())
    }
}

// MARK: - AirportsMapDisplayLogic
extension AirportsMapViewController: AirportsMapDisplayLogic {
    
    func displayFetchedAirports(viewModel: AirportsMap.GetAirports.ViewModel) {
        router?.routeDataToReachableAirports()
        viewLogic.stopLoading(at: self)
        viewLogic.set(airportsMapViewModel: viewModel)
    }
}

// MARK: - AirportsMapViewDelegate
extension AirportsMapViewController: AirportsMapViewDelegate {
    func didSelectLocation() {
        router?.routeToAirportDetail()
    }
}
