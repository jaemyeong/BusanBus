import XCTest

open class LaunchScreenUITests: XCTestCase {
    
    public final override class var runsForEachTargetApplicationUIConfiguration: Bool {
        return true
    }
    
    public final override func setUp() {
        super.setUp()
        
        self.continueAfterFailure = false
    }
    
    @MainActor
    public final func testView() {
        let app = XCUIApplication()
        app.launch()
        
        let view = app.otherElements["View"]
        XCTAssertTrue(view.exists)
        
        let textLabel = view.staticTexts["textLabel"]
        XCTAssertTrue(textLabel.exists)
        
        XCTAssertEqual(textLabel.label, "Hello, World!")
    }
}
