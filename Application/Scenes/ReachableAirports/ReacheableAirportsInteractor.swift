import Foundation
import Domain

protocol ReacheableAirportsBusinessLogic {
    
}

final class ReacheableAirportsInteractor: ReacheableAirportsBusinessLogic {
    
    var presenter: ReacheableAirportsPresentationLogic?
    
    let getFlights: GetFlights
    
    init(getFlights: GetFlights) {
        self.getFlights = getFlights
    }
    
}
