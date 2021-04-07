import Foundation
import XCTest
import Data
import Domain

class RemoteGetAirportsTests: XCTestCase {
    
    func test_sut_should_complete_with_success_when_http_client_completes_with_valid_data() {
        let (sut, httpSpy) = makeSut()
        let expectedResult = makeGetAirports()
        expect(sut, completeWith: .success(expectedResult)) {
            httpSpy.complete(withData: expectedResult.toData()!)
        }
    }
    
    func test_sut_should_complete_with_error_when_http_client_completes_with_invalid_format_data() {
        let (sut, httpSpy) = makeSut()
        expect(sut, completeWith: .failure(.dataConsistency)) {
            httpSpy.complete(withData: makeInvalidData())
        }
    }
    
    func test_sut_should_complete_with_error_when_http_client_completes_with_undecodable_data() {
        let (sut, httpSpy) = makeSut()
        expect(sut, completeWith: .failure(.dataConsistency)) {
            httpSpy.complete(withData: makeValidData())
        }
    }
    
    func test_sut_should_complete_with_error_when_http_client_completes_with_empty_data() {
        let (sut, httpSpy) = makeSut()
        expect(sut, completeWith: .failure(.dataConsistency)) {
            httpSpy.complete(withData: makeEmptyData())
        }
    }
    
    func test_sut_should_complete_with_error_when_http_client_completes_with_nil_data() {
        let (sut, httpSpy) = makeSut()
        expect(sut, completeWith: .failure(.dataConsistency)) {
            httpSpy.completeWithNilData()
        }
    }
    
    func test_sut_should_complete_with_error_when_http_client_completes_with_bad_request_error() {
        let (sut, httpSpy) = makeSut()
        expect(sut, completeWith: .failure(.notFound)) {
            httpSpy.complete(withError: .badRequest)
        }
    }
    
    func test_sut_should_complete_with_error_when_http_client_completes_with_forbbiden_error() {
        let (sut, httpSpy) = makeSut()
        expect(sut, completeWith: .failure(.notFound)) {
            httpSpy.complete(withError: .forbidden)
        }
    }
    
    func test_sut_should_complete_with_error_when_http_client_completes_with_no_connection_error() {
        let (sut, httpSpy) = makeSut()
        expect(sut, completeWith: .failure(.notFound)) {
            httpSpy.complete(withError: .noConnection)
        }
    }
    
    func test_sut_should_complete_with_error_when_http_client_completes_with_server_error() {
        let (sut, httpSpy) = makeSut()
        expect(sut, completeWith: .failure(.notFound)) {
            httpSpy.complete(withError: .serverError)
        }
    }
    
    func test_sut_should_complete_with_error_when_http_client_completes_with_unauthorized_error() {
        let (sut, httpSpy) = makeSut()
        expect(sut, completeWith: .failure(.notFound)) {
            httpSpy.complete(withError: .unauthorized)
        }
    }
    
    func test_sut_should_form_correct_url() {
        let (sut, httpSpy) = makeSut()
        sut.getAirports(getAirportsModel: GetAirportsModel()) { _ in }
        httpSpy.complete(withError: .badRequest)
        XCTAssertEqual(httpSpy.requests.first?.url?.absoluteString, "https://flightassets.datasavannah.com/test/airports.json")
    }
    
    func test_sut_should_not_complete_when_sut_is_deallocated() {
        let httpClientSpy = HttpClientSpy()
        var sut: RemoteGetAirports? = RemoteGetAirports(httpClient: httpClientSpy)
        var receivedResult: Result<Airports, GetAirportError>?
        
        sut?.getAirports(getAirportsModel: GetAirportsModel()) { receivedResult = $0 }
        sut = nil

        httpClientSpy.complete(withError: .noConnection)
        
        XCTAssertNil(receivedResult)
    }
}

// MARK: - Helper Methods
extension RemoteGetAirportsTests {
    
    func makeSut() -> (RemoteGetAirports, HttpClientSpy) {
        let httpSpy = HttpClientSpy()
        let sut = RemoteGetAirports(httpClient: httpSpy)
        checkMemoryLeak(for: sut)
        return (sut, httpSpy)
    }
    
    func expect(
        _ sut: RemoteGetAirports,
        completeWith expectedResult: Result<Airports, GetAirportError>,
        when action: () -> Void,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        let expect = expectation(description: "wait")
        sut.getAirports(getAirportsModel: GetAirportsModel()) { receivedResult in
            switch (expectedResult, receivedResult) {
                
            case (.failure(let expectedError), .failure(let receivedError)):
                XCTAssertEqual(expectedError, receivedError, file: file, line: line)
            case (.success(let expectedResult), .success(let receivedResult)):
                XCTAssertEqual(expectedResult, receivedResult, file: file, line: line)
                
            default: XCTFail("expecting \(expectedResult), got \(receivedResult)", file: file, line: line)
            }
            expect.fulfill()
        }
        action()
        wait(for: [expect], timeout: 1.0)
    }
}
