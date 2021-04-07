import Foundation
import UIKit

protocol AirportsMapDisplayLogic: AnyObject {
    func displayFetchedAirports(viewModel: AirportsMap.GetAirports.ViewModel)
}

final class AirportsMapViewController: UIViewController {
    
    let interactor: AirportsMapBusinessLogic
    
    // MARK: - Lifecycle
    init(interactor: AirportsMapBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        print(viewModel)
    }

}
