import Foundation
import UIKit

typealias AirportsMapRouterLogic =  (AirportsMapRoutingLogic & AirportsMapDataPassing)?

protocol AirportsMapRoutingLogic {
    func routeToAirportDetail()
}

protocol AirportsMapDataPassing {
    var dataStore: AirportsMapDataStore? { get }
}

final class AirportsMapRouter: AirportsMapDataPassing {
    weak var viewController: AirportsMapViewController?
    var dataStore: AirportsMapDataStore?
}

// MARK: - AirportsMapRoutingLogic
extension AirportsMapRouter: AirportsMapRoutingLogic {
    func routeToAirportDetail() {

    }
    
    func navigateToAirportDetail(source: AirportsMapViewController?, destination: UIViewController) {

    }
    
//    func passDataToAirportDetail(source: AirportsMapDataStore, destination: inout AirportDetailDataStore) {
//
//    }
}
