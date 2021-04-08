import Foundation
@testable import Application

final class ReachableAirportPresentationLogicSpy: ReachableAirportsPresentationLogic {
    
    var response: ReachableAirports.GetAirports.Response?
    var presentFetchedFlightsCalled = false
    
    func presentFetchedFlights(response: ReachableAirports.GetAirports.Response) {
        self.response = response
        presentFetchedFlightsCalled = true
        
    }
}
