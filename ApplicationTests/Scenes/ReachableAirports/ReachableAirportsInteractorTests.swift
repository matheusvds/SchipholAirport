import Foundation
import XCTest
import UI
import Domain
@testable import Application

final class ReachableAirportsInteractorTests: XCTestCase {
    
    func test_sut_should_call_get_flights_use_case() {
        let (sut, getFlightsStub, _) = makeSut()
        
        sut.fetchClosestsAirports(request: ReachableAirports.GetAirports.Request())
        
        XCTAssertTrue(getFlightsStub.getFlightsCalled)
    }

    func test_sut_should_call_presentation_logic_when_get_flights_complete_with_data() {
        let (sut, getFlightsStub, presentationSpy) = makeSut()
        
        sut.fetchClosestsAirports(request: ReachableAirports.GetAirports.Request())
        getFlightsStub.completeWith(data: makeFlights())
        
        XCTAssertTrue(presentationSpy.presentFetchedFlightsCalled)
    }
    
    func test_sut_should_call_presentation_logic_when_get_flights_complete_with_error() {
        let (sut, getFlightsStub, presentationSpy) = makeSut()
        
        sut.fetchClosestsAirports(request: ReachableAirports.GetAirports.Request())
        getFlightsStub.completeWith(error: .notFound)
        
        XCTAssertTrue(presentationSpy.presentFetchedFlightsCalled)
    }
    
    func test_sut_should_call_presentation_logic_with_correct_response_when_get_flights_complete_with_data() {
        let (sut, getFlightsStub, presentationSpy) = makeSut()
        let expectedResult = makeFlights()
        sut.fetchClosestsAirports(request: ReachableAirports.GetAirports.Request())
        getFlightsStub.completeWith(data: expectedResult)
        
        XCTAssertEqual(presentationSpy.response?.flights, expectedResult)
    }
    
    func test_sut_should_call_presentation_logic_with_correct_response_when_get_flights_complete_with_error() {
        let (sut, getFlightsStub, presentationSpy) = makeSut()
        
        sut.fetchClosestsAirports(request: ReachableAirports.GetAirports.Request())
        getFlightsStub.completeWith(error: .notFound)
        
        XCTAssertNil(presentationSpy.response?.flights)
    }
}

extension ReachableAirportsInteractorTests {
    func makeSut() -> (ReachableAirportsInteractor, GetFlightsSpy, ReachableAirportPresentationLogicSpy) {
        let getFlightsStub = GetFlightsSpy()
        let presentationSpy = ReachableAirportPresentationLogicSpy()
        let sut = ReachableAirportsInteractor(getFlights: getFlightsStub)
        sut.presenter = presentationSpy
        
        return (sut, getFlightsStub, presentationSpy)
    }
}
