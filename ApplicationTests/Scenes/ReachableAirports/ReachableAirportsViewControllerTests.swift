import Foundation
import XCTest
import UI
@testable import Application

final class ReachableAirportsViewControllerTests: XCTestCase {
    
    func test_sut_should_call_interactor_to_fetch_airports() {
        let (sut, businessLogicSpy, _) = makeSut()
        
        sut.viewDidLoad()
        
        XCTAssertTrue(businessLogicSpy.fetchClosestsAirportsCalled)
    }
    
    func test_sut_should_call_view_logic_to_show_loading() {
        let (sut, _, viewLogicSpy) = makeSut()
        
        sut.viewDidLoad()
        
        XCTAssertTrue(viewLogicSpy.startLoadingCalled)
    }
    
}


extension ReachableAirportsViewControllerTests {
    
    func makeSut() -> (ReachableAirportsViewController, ReachableAirportsBusinessLogicSpy, ReachableAirportsViewLogicSpy)   {
        let routerDummy = ReachableAirportsRouterLogicDummy()
        let businessLogicSpy = ReachableAirportsBusinessLogicSpy()
        let viewLogicSpy = ReachableAirportsViewLogicSpy()
        let sut = ReachableAirportsViewController(interactor: businessLogicSpy, viewLogic: viewLogicSpy, router: routerDummy)
        
        return (sut, businessLogicSpy, viewLogicSpy)
    }
    
}
