import Foundation
import CoreLocation

protocol AirportDetailPresentationLogic {
    func presentAirportDetail(response: AirportDetail.GetDetail.Response)
}

final class AirportDetailPresenter {
    weak var viewController: AirportDetailDisplayLogic?
}

extension AirportDetailPresenter: AirportDetailPresentationLogic {
    
    func presentAirportDetail(response: AirportDetail.GetDetail.Response) {
        let selectedAirport = response.selectedAirport
        let airportsLocations = response.airports.map {
            AirportLocation(name: $0.name, location: CLLocation(latitude: $0.latitude, longitude: $0.longitude))
        }
        let selectedLocation = CLLocation(latitude: selectedAirport.latitude, longitude: selectedAirport.longitude)
        let sortedLocations = airportsLocations.sorted { selectedLocation.distance(from: $0.location) < selectedLocation.distance(from: $1.location) }
        
        guard let nearestAirport = sortedLocations.dropFirst().first else { return }
        let nearestDistance = nearestAirport.location.distance(from: selectedLocation)/1000
        
        let viewModel = AirportDetail.GetDetail.ViewModel(
            airportName: selectedAirport.name,
            location: "\(selectedAirport.latitude), \(selectedAirport.longitude)",
            city: selectedAirport.city,
            countryID: selectedAirport.countryId,
            airportID: selectedAirport.id,
            nearestAirport: nearestAirport.name,
            nearestAirportDistance: "\(String(format:"%.02f", nearestDistance)) km"
        )
        
        viewController?.displayAirportDetail(viewModel: viewModel)
    }
}

private struct AirportLocation {
    let name: String
    let location: CLLocation
}
