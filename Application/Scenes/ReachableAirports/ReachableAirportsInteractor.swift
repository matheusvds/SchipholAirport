import Foundation
import Domain

protocol ReachableAirportsBusinessLogic {
    func fetchFlights(request: ReachableAirports.GetFlights.Request)
}

protocol ReachableAirportsDataStore {
    var airports: Airports! { get set }
}

final class ReachableAirportsInteractor: ReachableAirportsDataStore {
    
    var airports: Airports!
    
    var presenter: ReachableAirportsPresentationLogic?
    
    let getFlights: GetFlights
    
    init(getFlights: GetFlights) {
        self.getFlights = getFlights
    }
    
}

extension ReachableAirportsInteractor: ReachableAirportsBusinessLogic {
    
    func fetchFlights(request: ReachableAirports.GetFlights.Request) {
        
    }
    
}
