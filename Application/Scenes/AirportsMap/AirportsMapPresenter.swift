import Foundation
import CoreLocation

protocol AirportsMapPresentationLogic {
    func presentFetchedAirports(response: AirportsMap.GetAirports.Response)
}

final class AirportsPresenter {
    weak var displayLogic: AirportsMapDisplayLogic?
}

extension AirportsPresenter: AirportsMapPresentationLogic {
    
    func presentFetchedAirports(response: AirportsMap.GetAirports.Response) {
        
        guard let airports = response.airports else { return }
        
        let locations = airports.map {
            DisplayedAirport(
                id: $0.id,
                location: CLLocation(latitude: $0.latitude, longitude: $0.longitude)
            )
        }
        
        displayLogic?.displayFetchedAirports(viewModel: AirportsMap.GetAirports.ViewModel(items: locations))
    }
    
}
