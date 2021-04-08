import Foundation
import Domain

final class GetFlightsSpy: GetFlights {
    
    var completion: ((GetFlights.Result) -> Void)?
    var getFlightsCalled = false
    
    func getFlights(getFlightsModel: GetFlightsModel, completion: @escaping (GetFlights.Result) -> Void) {
        self.completion = completion
        getFlightsCalled = true
    }
    
    func completeWith(data: Flights) {
        completion?(.success(data))
    }
    
    func completeWith(error: DomainError) {
        completion?(.failure(error))
    }
}
