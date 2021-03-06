import Foundation
import UIKit

typealias AirportsMapRouterLogic = (AirportsMapRoutingLogic & AirportsMapDataPassing)?

protocol AirportsMapRoutingLogic {
    func routeToAirportDetail()
    func routeDataToReachableAirports()
}

protocol AirportsMapDataPassing {
    var dataStore: AirportsMapDataStore? { get }
}

final class AirportsMapRouter: NSObject, AirportsMapDataPassing {
    weak var viewController: AirportsMapViewController?
    var dataStore: AirportsMapDataStore?
    weak var airportDetailFactory: AirportDetailFactory!
    weak var reachableAirportsDataSharing: ReachableAirportsDataSharing!
}

// MARK: - AirportsMapRoutingLogic
extension AirportsMapRouter: AirportsMapRoutingLogic {
    
    func routeDataToReachableAirports() {
        var destinationDataStore = reachableAirportsDataSharing.reachableAirportsDataPassing!.dataStore!
        passDataToReachableAirports(source: dataStore!, destination: &destinationDataStore)
    }
    
    func routeToAirportDetail() {
        let destinationVC = airportDetailFactory.makeAirportDetailScene() as! AirportDetailViewController
        var destinationDataStore = destinationVC.router?.dataStore
        passDataToAirportDetail(source: dataStore!, destination: &destinationDataStore!)
        navigateToAirportDetail(source: viewController, destination: destinationVC)
        
    }
    
    func navigateToAirportDetail(source: AirportsMapViewController?, destination: UIViewController) {
        DispatchQueue.main.async {
            destination.modalPresentationStyle = .automatic
            destination.modalTransitionStyle = .coverVertical
            if let destination = destination as? AirportDetailViewController {
                destination.dismissBlock = { [weak source] in source?.viewLogic.clearSelection() }
            }
            source?.present(destination, animated: true)
        }
    }
    
    func passDataToAirportDetail(source: AirportsMapDataStore, destination: inout AirportDetailDataStore) {
        let selectedAirportLocation = viewController?.viewLogic.getSelectedLocation()
        let airport = dataStore?.airports.first(where: { $0.id == selectedAirportLocation?.title })
        destination.selectedAirport = airport
        destination.airports = source.airports
    }
    
    func passDataToReachableAirports(source: AirportsMapDataStore, destination: inout ReachableAirportsDataStore) {
        destination.airports = source.airports
    }
}
