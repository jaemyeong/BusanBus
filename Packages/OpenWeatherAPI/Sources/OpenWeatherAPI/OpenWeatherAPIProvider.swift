import Foundation

import ErrorKit

public final class OpenWeatherAPIProvider {
    private let apiKey: String
    
    private let session: URLSession
    
    public init(apiKey: String) {
        self.apiKey = apiKey
        
        self.session = {
            let configuration = URLSessionConfiguration.default
            
            return URLSession(configuration: configuration)
        }()
    }
    
    public func data(target: OpenWeatherAPI) async throws -> (Data, HTTPURLResponse) {
        var components = URLComponents()
        components.path = target.path
        components.queryItems = target.parameters.map {
            URLQueryItem(name: "\($0)", value: "\($1)")
        } + [
            URLQueryItem(name: "appid", value: self.apiKey)
        ]
        
        guard let url = components.url(relativeTo: target.baseURL) else {
            throw NilError()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = target.method.rawValue
        
        target.headerFields.forEach {
            request.setValue("\($1)", forHTTPHeaderField: "\($0)")
        }
        
        let (data, response) = try await self.data(for: request)
        
        try Task.checkCancellation()
        
        guard let response = response as? HTTPURLResponse else {
            throw TypeCastingError()
        }
        
        return (data, response)
    }
    
    private func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        if #available(iOS 15.0, *) {
            return try await self.session.data(for: request)
        } else {
            return try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<(Data, URLResponse), Error>) in
                self.session.dataTask(with: request) { data, response, error  in
                    if let error = error {
                        continuation.resume(throwing: error)
                        return
                    }
                    
                    guard let data = data else {
                        continuation.resume(throwing: NilError())
                        return
                    }
                    
                    guard let response = response else {
                        continuation.resume(throwing: NilError())
                        return
                    }
                    
                    continuation.resume(returning: (data, response))
                }
                .resume()
            }
        }
    }
}
