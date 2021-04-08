import Foundation
import Domain

protocol AirportsMapBusinessLogic {
    func fetchAirports(request: AirportsMap.GetAirports.Request)
}

protocol AirportsMapDataStore {
    var airports: Airports { get }
}

final class AirportsMapInteractor: AirportsMapDataStore {
    
    var presenter: AirportsMapPresentationLogic?
    var airports: Airports
    
    //MARK: - Use Cases
    let getAirports: GetAirports
    
    init(getAirports: GetAirports, airports: Airports = []) {
        self.getAirports = getAirports
        self.airports = airports
    }
}

extension AirportsMapInteractor: AirportsMapBusinessLogic {
    
    func fetchAirports(request: AirportsMap.GetAirports.Request) {
        getAirports.getAirports(getAirportsModel: GetAirportsModel()) { [weak self] in
            switch $0 {
            case .success(let airports):
                self?.airports = airports
                let response = AirportsMap.GetAirports.Response(airports: airports)
                self?.presenter?.presentFetchedAirports(response: response)
            case .failure:
                let response = AirportsMap.GetAirports.Response(airports: nil)
                self?.presenter?.presentFetchedAirports(response: response)
            }
        }
    }
}
