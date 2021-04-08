import Foundation
import Domain

protocol AirportDetailBusinessLogic {
    func fetchAirportDetail(request: AirportDetail.GetDetail.Request)
}

protocol AirportDetailDataStore {
    var airports: Airports! { get set }
    var selectedAirport: Airport! { get set }
}

final class AirportDetailInteractor: AirportDetailDataStore {
    
    var airports: Airports!
    var selectedAirport: Airport!
    
    var presenter: AirportDetailPresentationLogic?
    
}

extension AirportDetailInteractor: AirportDetailBusinessLogic {
    
    func fetchAirportDetail(request: AirportDetail.GetDetail.Request) {
        let response = AirportDetail.GetDetail.Response(selectedAirport: selectedAirport, airports: airports)
        presenter?.presentAirportDetail(response: response)
    }
}
