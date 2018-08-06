import XCTest
@testable import GhostTyping

final class GhostTypingTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(GhostTyping().text, "Hello, World!")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
