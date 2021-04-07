import Foundation
import XCTest
import Data
import Domain

class RemoteGetFlightsTests: XCTestCase {
    
    func test_sut_should_complete_with_success_when_http_client_completes_with_valid_data() {
        let (sut, httpSpy) = makeSut()
        let expectedResult = makeFlights()
        expect(sut, completeWith: .success(expectedResult), when: {
            httpSpy.complete(withData: expectedResult.toData()!)
        })
    }
    
    func test_sut_should_complete_with_error_when_http_client_completes_with_invalid_format_data() {
        let (sut, httpSpy) = makeSut()
        expect(sut, completeWith: .failure(.dataConsistency), when: {
            httpSpy.complete(withData: makeInvalidData())
        })
    }
    
    func test_sut_should_complete_with_error_when_http_client_completes_with_undecodable_data() {
        let (sut, httpSpy) = makeSut()
        expect(sut, completeWith: .failure(.dataConsistency), when: {
            httpSpy.complete(withData: makeValidData())
        })
    }
    
    func test_sut_should_complete_with_error_when_http_client_completes_with_empty_data() {
        let (sut, httpSpy) = makeSut()
        expect(sut, completeWith: .failure(.dataConsistency), when: {
            httpSpy.complete(withData: makeEmptyData())
        })
    }
    
    func test_sut_should_complete_with_error_when_http_client_completes_with_nil_data() {
        let (sut, httpSpy) = makeSut()
        expect(sut, completeWith: .failure(.dataConsistency), when: {
            httpSpy.completeWithNilData()
        })
    }
    
    func test_sut_should_complete_with_error_when_http_client_completes_with_bad_request_error() {
        let (sut, httpSpy) = makeSut()
        expect(sut, completeWith: .failure(.notFound), when: {
            httpSpy.complete(withError: .badRequest)
        })
    }
    
    func test_sut_should_complete_with_error_when_http_client_completes_with_forbbiden_error() {
        let (sut, httpSpy) = makeSut()
        expect(sut, completeWith: .failure(.notFound), when: {
            httpSpy.complete(withError: .forbidden)
        })
    }
    
    func test_sut_should_complete_with_error_when_http_client_completes_with_no_connection_error() {
        let (sut, httpSpy) = makeSut()
        expect(sut, completeWith: .failure(.notFound), when: {
            httpSpy.complete(withError: .noConnection)
        })
    }
    
    func test_sut_should_complete_with_error_when_http_client_completes_with_server_error() {
        let (sut, httpSpy) = makeSut()
        expect(sut, completeWith: .failure(.notFound), when: {
            httpSpy.complete(withError: .serverError)
        })
    }
    
    func test_sut_should_complete_with_error_when_http_client_completes_with_unauthorized_error() {
        let (sut, httpSpy) = makeSut()
        expect(sut, completeWith: .failure(.notFound), when: {
            httpSpy.complete(withError: .unauthorized)
        })
    }
    
    func test_sut_should_have_single_request() {
        let (sut, httpSpy) = makeSut()
        sut.getFlights(getFlightsModel: GetFlightsModel()) { _ in }
        httpSpy.complete(withError: .badRequest)
        XCTAssertEqual(httpSpy.requests.count, 1)
    }
    
    func test_sut_should_form_correct_url() {
        let (sut, httpSpy) = makeSut()
        sut.getFlights(getFlightsModel: GetFlightsModel()) { _ in }
        httpSpy.complete(withError: .badRequest)
        XCTAssertEqual(httpSpy.requests.first?.url?.absoluteString, "https://flightassets.datasavannah.com/test/flights.json")
    }
    
    func test_sut_should_not_complete_when_sut_is_deallocated() {
        let httpClientSpy = HttpClientSpy()
        var sut: RemoteGetFlights? = RemoteGetFlights(httpClient: httpClientSpy)
        var receivedResult: Result<Flights, DomainError>?
        
        sut?.getFlights(getFlightsModel: GetFlightsModel()) { receivedResult = $0 }
        sut = nil

        httpClientSpy.complete(withError: .noConnection)
        
        XCTAssertNil(receivedResult)
    }
}

// MARK: - Helper Methods
extension RemoteGetFlightsTests {
    
    func makeSut() -> (RemoteGetFlights, HttpClientSpy) {
        let httpSpy = HttpClientSpy()
        let sut = RemoteGetFlights(httpClient: httpSpy)
        checkMemoryLeak(for: sut)
        return (sut, httpSpy)
    }
    
    func expect(
        _ sut: RemoteGetFlights,
        completeWith expectedResult: Result<Flights, DomainError>,
        when action: () -> Void,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        let expect = expectation(description: "wait")
        sut.getFlights(getFlightsModel: GetFlightsModel()) { receivedResult in
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
