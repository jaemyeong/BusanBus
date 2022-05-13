import XCTest

@testable import OpenWeatherAPI

public final class OpenWeatherAPITests: XCTestCase {
    public func testBaseURL() {
        XCTAssertNotNil(URL(string: "https://api.openweathermap.org"))
    }
}
