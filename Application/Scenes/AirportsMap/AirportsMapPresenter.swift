import Foundation
import CoreLocation

protocol AirportsMapPresentationLogic {
    func presentFetchedAirports(response: AirportsMap.GetAirports.Response)
}

final class AirportsMapPresenter {
    weak var displayLogic: AirportsMapDisplayLogic?
}

// MARK: - AirportsMapPresentationLogic
extension AirportsMapPresenter: AirportsMapPresentationLogic {
    
    func presentFetchedAirports(response: AirportsMap.GetAirports.Response) {
        
        guard let airports = response.airports else { return }
        
        let locations = airports.map {
            DisplayedLocations(
                title: $0.id,
                subtitle: $0.city,
                coordinate: CLLocation(latitude: $0.latitude, longitude: $0.longitude).coordinate
            )
        }
        
        displayLogic?.displayFetchedAirports(viewModel: AirportsMap.GetAirports.ViewModel(items: locations))
    }
}
