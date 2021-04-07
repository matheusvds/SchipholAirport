import Foundation
import CoreLocation

protocol AirportsMapPresentationLogic {
    func presentFetchedAirports(response: AirportsMap.GetAirports.Response)
}

final class AirportsMapPresenter {
    weak var displayLogic: AirportsMapDisplayLogic?
}

extension AirportsMapPresenter: AirportsMapPresentationLogic {
    
    func presentFetchedAirports(response: AirportsMap.GetAirports.Response) {
        
        guard let airports = response.airports else { return }
        
        let locations = airports.map {
            DisplayedLocations(
                id: $0.id,
                location: CLLocation(latitude: $0.latitude, longitude: $0.longitude)
            )
        }
        
        displayLogic?.displayFetchedAirports(viewModel: AirportsMap.GetAirports.ViewModel(items: locations))
    }
    
}
