import XCTest

import os

@testable import OpenWeatherAPI

public final class OpenWeatherAPIProviderTests: XCTestCase {
    private var provider: OpenWeatherAPIProvider?
    
    public override func setUp() {
        super.setUp()
        
        self.provider = OpenWeatherAPIProvider(apiKey: "8d21af09f54bdba3a8b0582ab3feb01a")
    }
    
    public override func tearDown() {
        super.tearDown()
        
        self.provider = nil
    }
    
    public func testProvider() async throws {
        let provider = try XCTUnwrap(self.provider)
        
        let (data, response) = try await provider.data(target: .currentWeatherData)
        
        XCTAssertFalse(data.isEmpty)
        
        XCTAssertEqual(response.statusCode, 200)
        
        let weather = try Weather(data: data)
        
        os_log(.debug, "%@", String(describing: weather))
    }
}
