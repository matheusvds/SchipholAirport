import Foundation
import Domain

protocol ReachableAirportsBusinessLogic {
    func fetchClosestsAirports(request: ReachableAirports.GetAirports.Request)
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
    
    func fetchClosestsAirports(request: ReachableAirports.GetAirports.Request) {
        getFlights.getFlights(getFlightsModel: GetFlightsModel()) { [weak self] in
            switch $0 {
            case .success(let flights):
                let response = ReachableAirports.GetAirports.Response(flights: flights, airports: self?.airports)
                self?.presenter?.presentFetchedFlights(response: response)
            case .failure:
                let response = ReachableAirports.GetAirports.Response(flights: nil, airports: nil)
                self?.presenter?.presentFetchedFlights(response: response)

            }
        }
    }
    
}
