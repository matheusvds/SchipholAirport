import Foundation
import Domain

func makeDummyURL() -> URL {
    return URL(string: "https://anyurl.com")!
}

func makeDummyRequest() -> URLRequest {
    return URLRequest(url: makeDummyURL())
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

func makeInvalidData() -> Data {
    return Data("invalid data".utf8)
}

func makeError() -> Error {
    return NSError(domain: "any", code: 0)
}

struct DummyDecodable: Codable, Equatable {
    let property: String
}
