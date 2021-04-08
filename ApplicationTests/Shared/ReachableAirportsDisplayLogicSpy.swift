import Foundation
@testable import Application

final class ReachableAirportsDisplayLogicSpy: ReachableAirportsDisplayLogic {
    
    var viewModel: ReachableAirports.GetAirports.ViewModel?
    var displayClosestsAirportsCalled = false
    
    func displayClosestsAirports(viewModel: ReachableAirports.GetAirports.ViewModel) {
        self.viewModel = viewModel
        displayClosestsAirportsCalled = true
    }
}
