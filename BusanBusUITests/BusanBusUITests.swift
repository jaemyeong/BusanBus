import XCTest

public final class BusanBusUITests: XCTestCase {
    
    public override class var runsForEachTargetApplicationUIConfiguration: Bool {
        return true
    }
    
    public override func setUp() {
        super.setUp()
        
        self.continueAfterFailure = false
    }
    
    public func testView() {
        let app = XCUIApplication()
        app.launch()
        
        let view = app.otherElements["View"]
        XCTAssertTrue(view.exists)
        
        let textLabel = view.staticTexts["textLabel"]
        XCTAssertTrue(textLabel.exists)
        
        XCTAssertEqual(textLabel.label, "Hello, World!")
    }
}
