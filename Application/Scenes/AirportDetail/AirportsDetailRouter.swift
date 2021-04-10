import Foundation

typealias AirportDetailRouterLogic = (AirportDetailRoutingLogic & AirportDetailDataPassing)?

protocol AirportDetailRoutingLogic { }

protocol AirportDetailDataPassing {
    var dataStore: AirportDetailDataStore? { get }
}

final class AirportDetailRouter: AirportDetailDataPassing {
    weak var viewController: AirportDetailViewController?
    var dataStore: AirportDetailDataStore?
}

// MARK: - AirportDetailRoutingLogic
extension AirportDetailRouter: AirportDetailRoutingLogic { }
