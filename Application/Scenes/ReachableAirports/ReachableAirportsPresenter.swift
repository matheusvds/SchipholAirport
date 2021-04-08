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
        
        let schipholDestinations = flights.filter { $0.departureAirportId == "AMS"  }.map { $0.arrivalAirportId }
        let destinationsSet = Set(schipholDestinations)
        
        let reachableAirports = airports.filter { destinationsSet.contains($0.id) }
        
        let schipholAirportLocation = CLLocation(latitude: schipholAirport.latitude, longitude: schipholAirport.longitude)
        
        let sortedAirports: [ReachableAiport] = reachableAirports
            .map {
                let location = CLLocation(latitude: $0.latitude, longitude: $0.longitude)
                let distance = location.distance(from: schipholAirportLocation)/1000
                return ReachableAiport(id: $0.id, name: $0.name, location: location, distance: distance)
            }
            .sorted { $0.distance < $1.distance }
        
        let items: [DisplayedItems] = sortedAirports.map {
            DisplayedItems(
                id: $0.id,
                name: $0.name,
                distance: "\(String(format:"%.02f", $0.distance)) km"
            )
        }

        let viewModel = ReachableAirports.GetAirports.ViewModel(items: items)
        viewController?.displayClosestsAirports(viewModel: viewModel)
    }
}

private struct ReachableAiport {
    let id: String
    let name: String
    let location: CLLocation
    let distance: Double
}
