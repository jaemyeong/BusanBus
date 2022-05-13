import Foundation

public enum OpenWeatherAPI {
    case currentWeatherData
    
    internal var baseURL: URL {
        switch self {
        case .currentWeatherData:
            assert(URL(string: "https://api.openweathermap.org") != nil)
            return URL(string: "https://api.openweathermap.org")!
        }
    }
    
    internal var headerFields: [AnyHashable: Any] {
        switch self {
        case .currentWeatherData:
            return [
                "Accept": "application/json"
            ]
        }
    }
    
    internal var method: HTTPMethod {
        switch self {
        case .currentWeatherData:
            return .get
        }
    }
    
    internal var path: String {
        switch self {
        case .currentWeatherData:
            return "/data/2.5/weather"
        }
    }
    
    internal var parameters: [AnyHashable: Any] {
        switch self {
        case .currentWeatherData:
            return [
                "lang": "kr",
                "q": "Busan,KR",
            ]
        }
    }
    
    internal var expectedValue: (Data, HTTPURLResponse) {
        switch self {
        case .currentWeatherData:
            let url = URL(string: "")!
            
            return (
                Data(),
                HTTPURLResponse(
                    url: url,
                    statusCode: 200,
                    httpVersion: "HTTP/1.1",
                    headerFields: [:]
                )!
            )
        }
    }
}
