import Foundation
import Domain

public final class RemoteGetAirports: GetAirports {
    
    private let httpClient: HttpClient
    
    public init(httpClient: HttpClient) {
        self.httpClient = httpClient
    }
    
    public func getAirports(getAirportsModel: GetAirportsModel, completion: @escaping (GetAirports.Result) -> Void) {
        let getAirportsRequest = GetAirportsRequest().request
        httpClient.get(request: getAirportsRequest) { [weak self] in
            guard self != nil else { return }
            switch $0 {
            case .success(let data):
                guard let model: Airports = data?.toModel() else {
                    return completion(.failure(.dataConsistency))
                }
                return completion(.success(model))
            case .failure:
                return completion(.failure(.notFound))
            }
        }
    }
}
