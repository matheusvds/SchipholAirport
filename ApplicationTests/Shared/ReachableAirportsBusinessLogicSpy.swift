import Foundation
@testable import Application

final class ReachableAirportsBusinessLogicSpy: ReachableAirportsBusinessLogic {
    
    var fetchClosestsAirportsCalled = false
    
    func fetchClosestsAirports(request: ReachableAirports.GetAirports.Request) {
        fetchClosestsAirportsCalled = true
    }
}
