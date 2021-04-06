import Foundation

public protocol AirportsAPIRequest {
    
    var resource: Airport.Resource { get }
}

public extension AirportsAPIRequest {
    
    var scheme: String {
        return "https"
    }
    
    var baseURL: String {
        return "flightassets.datasavannah.com"
    }
    
    var path: String {
        return "/test/"
    }
    
    var queryItems: [URLQueryItem] {
        return []
    }
    
    var serviceURL: URL {
        var components = URLComponents()
        components.scheme = scheme
        components.host = baseURL
        components.path = path.appending(resource.name)
        components.queryItems = queryItems
        guard let url = components.url else {
            fatalError("Malformed URL")
        }
        return url
    }
    
    var request: URLRequest {
        return URLRequest(url: serviceURL)
    }
}
