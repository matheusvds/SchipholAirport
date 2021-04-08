import Foundation
import Domain

protocol AirportDetailBusinessLogic {
    func fetchAirportDetail(request: AirportDetail.GetDetail.Request)
}

protocol AirportDetailDataStore {
    var airport: Airport! { get set }
}

final class AirportDetailInteractor: AirportDetailDataStore {
    
    var airport: Airport!
    
    var presenter: AirportDetailPresentationLogic?
    
}

extension AirportDetailInteractor: AirportDetailBusinessLogic {
    
    func fetchAirportDetail(request: AirportDetail.GetDetail.Request) {
        
    }
}
