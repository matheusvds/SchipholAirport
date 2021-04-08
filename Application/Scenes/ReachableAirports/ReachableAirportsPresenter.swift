import Foundation
import CoreLocation

protocol ReachableAirportsPresentationLogic {
    func presentFetchedFlights(response: ReachableAirports.GetAirports.Response)
}

final class ReachableAirportsPresenter {
    
    weak var viewController: ReachableAirportsDisplayLogic?
    
}

extension ReachableAirportsPresenter: ReachableAirportsPresentationLogic {
    
    func presentFetchedFlights(response: ReachableAirports.GetAirports.Response) {
        guard
            let airports = response.airports,
            let flights = response.flights,
            let schipholAirport = airports.first(where: { $0.id == "AMS" })
        else { return }
        let schipholAirportLocation = CLLocation(latitude: schipholAirport.latitude, longitude: schipholAirport.longitude)
        
        let schipholDestinations = flights.filter { $0.departureAirportId == "AMS"  }.map { $0.arrivalAirportId }
        let destinationsSet = Set(schipholDestinations)
        
        let reachableAirports = airports.filter { destinationsSet.contains($0.id) }
        
        let sortedAirports = reachableAirports.sorted { (first, second) -> Bool in
            let firstLocation = CLLocation(latitude: first.latitude, longitude: first.longitude)
            let secondLocation = CLLocation(latitude: second.latitude, longitude: second.longitude)
            return schipholAirportLocation.distance(from: firstLocation) < schipholAirportLocation.distance(from: secondLocation)
        }
        
        let items: [DisplayedItems] = sortedAirports.map {
            let location = CLLocation(latitude: $0.latitude, longitude: $0.longitude)
            let distance = schipholAirportLocation.distance(from: location)/1000
            return DisplayedItems(
                id: $0.id,
                name: $0.name,
                distance: "\(String(format:"%.02f", distance)) km"
            )
        }
        
        let viewModel = ReachableAirports.GetAirports.ViewModel(items: items)
        viewController?.displayClosestsAirports(viewModel: viewModel)
    }
}
