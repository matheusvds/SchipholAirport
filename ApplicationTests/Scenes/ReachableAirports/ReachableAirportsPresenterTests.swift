import Foundation
@testable import Application
import XCTest

final class ReachableAirportsPresenterTests: XCTestCase {
    
    func test_sut_should_call_display_logic_when_response_is_valid() {
        let (sut, displayLogicSpy) = makeSut()
        
        let response = ReachableAirports.GetAirports.Response(flights: makeFlights(), airports: makeGetAirports())
        sut.presentFetchedFlights(response: response)
        
        XCTAssertTrue(displayLogicSpy.displayClosestsAirportsCalled)
    }
    
    func test_sut_should_not_call_display_logic_when_response_is_invalid() {
        let (sut, displayLogicSpy) = makeSut()
        
        let response = ReachableAirports.GetAirports.Response(flights: nil, airports: nil)
        sut.presentFetchedFlights(response: response)
        
        XCTAssertFalse(displayLogicSpy.displayClosestsAirportsCalled)
    }
    
    func test_sut_should_have_proper_formated_view_model_when_response_is_valid() {
        let (sut, displayLogicSpy) = makeSut()
        
        let response = ReachableAirports.GetAirports.Response(flights: makeFlights(), airports: makeGetAirports())
        sut.presentFetchedFlights(response: response)
        
        XCTAssertEqual(displayLogicSpy.viewModel!.items.first?.name, "Rotterdam The Hague Airport")
        XCTAssertEqual(displayLogicSpy.viewModel!.items.first?.distance, "46.00 km")
    }
}

extension ReachableAirportsPresenterTests {
    
    func makeSut() -> (ReachableAirportsPresenter, ReachableAirportsDisplayLogicSpy) {
        let sut = ReachableAirportsPresenter()
        let displayLogicSpy = ReachableAirportsDisplayLogicSpy()
        sut.viewController = displayLogicSpy
        
        return (sut, displayLogicSpy)
    }
    
}
