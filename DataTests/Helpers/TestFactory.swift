import Foundation
import Domain

func makeDummyURL() -> URL {
    return URL(string: "https://anyurl.com")!
}

func makeDummyRequest() -> URLRequest {
    return URLRequest(url: makeDummyURL())
}

func makeHttpResponse(statusCode code: Int = 200) -> HTTPURLResponse {
    return HTTPURLResponse(url: makeDummyURL(), statusCode: code, httpVersion: nil, headerFields: nil)!
}

func makeValidData() -> Data {
    return Data("{\"property\":\"value\"}".utf8)
}

func makeEmptyData() -> Data {
    return Data()
}

func makeGetAirports() -> Airports {
    let airports: Airports? = getAirportsJSON.data(using: .utf8)?.toModel()
    return airports!
}

func makeFlights() -> Flights {
    let flights: Flights? = getFlightsJSON.data(using: .utf8)?.toModel()
    return flights!
}

func makeInvalidData() -> Data {
    return Data("invalid data".utf8)
}

func makeError() -> Error {
    return NSError(domain: "any", code: 0)
}

struct DummyDecodable: Codable, Equatable {
    let property: String
}

private extension Data {
    func toModel<T: Decodable>() -> T? {
        return try? JSONDecoder().decode(T.self, from: self)
    }
}
