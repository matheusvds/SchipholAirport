import Foundation

public protocol HttpClient {
    
    typealias Result = Swift.Result<Data?, HttpError>
    func get(request: URLRequest, completion: @escaping (Result) -> Void)
}
