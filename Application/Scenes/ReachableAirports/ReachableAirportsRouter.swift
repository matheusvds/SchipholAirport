import Foundation

typealias ReachableAirportsRouterLogic = ReachableAirportsRoutingLogic & ReachableAirportsDataPassing

protocol ReachableAirportsRoutingLogic { }

protocol ReachableAirportsDataPassing {
    var dataStore: ReachableAirportsDataStore? { get }
}

final class ReachableAirportsRouter: ReachableAirportsDataPassing {
    weak var viewController: ReachableAirportsViewController?
    var dataStore: ReachableAirportsDataStore?
}

// MARK: - ReachableAirportsRoutingLogic
extension ReachableAirportsRouter: ReachableAirportsRoutingLogic { }
