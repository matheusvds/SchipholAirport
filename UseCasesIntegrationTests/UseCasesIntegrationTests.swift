import Data
import Domain
import Infra
import XCTest

class UseCasesIntegrationTests: XCTestCase {

    func test_get_airports() {
        let urlSessionAdapter = URLSessionAdapter()
        let sut = RemoteGetAirports(httpClient: urlSessionAdapter)
        
        let expect = expectation(description: "waiting")
        
        sut.getAirports(getAirportsModel: GetAirportsModel()) {
            switch $0 {
            case .success(let airports): XCTAssertFalse(airports.isEmpty)
            case .failure: XCTFail("expecting success, got \($0)")
            }
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 5.0)
    }

}
