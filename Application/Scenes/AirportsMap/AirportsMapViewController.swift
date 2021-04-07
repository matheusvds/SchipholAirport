import Foundation
import UIKit
import UI

protocol AirportsMapDisplayLogic: AnyObject {
    func displayFetchedAirports(viewModel: AirportsMap.GetAirports.ViewModel)
}

final class AirportsMapViewController: UIViewController {
    
    let interactor: AirportsMapBusinessLogic
    let viewLogic: AirportMapViewLogic
    
    // MARK: - Lifecycle
    init(interactor: AirportsMapBusinessLogic, viewLogic: AirportMapViewLogic) {
        self.interactor = interactor
        self.viewLogic = viewLogic
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
        interactor.fetchAirports(request: AirportsMap.GetAirports.Request())
    }
}

extension AirportsMapViewController: AirportsMapDisplayLogic {
    
    func displayFetchedAirports(viewModel: AirportsMap.GetAirports.ViewModel) {
        viewLogic.set(airportsMapViewModel: viewModel)
    }

}

extension AirportsMapViewController: AirportsMapViewDelegate {
    func didSelect(_ airportLocation: AirportLocationRepresentable) {
        
    }
}
