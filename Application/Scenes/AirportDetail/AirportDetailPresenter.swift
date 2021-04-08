import Foundation

protocol AirportDetailPresentationLogic {
    func presentAirportDetail(response: AirportDetail.GetDetail.Response)
}

final class AirportDetailPresenter {
    weak var viewController: AirportDetailDisplayLogic?
}

extension AirportDetailPresenter: AirportDetailPresentationLogic {
    
    func presentAirportDetail(response: AirportDetail.GetDetail.Response) {
        
    }
}
