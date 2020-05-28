import XCTest
@testable import FunctionalSwift

final class PipeTests: XCTestCase {
    func testPipe() {
        func process(value: Int) -> Int {
            return value + 1
        }
        
        let a = 0
        
        let result = a |> process(value:)
        XCTAssertEqual(1, result)
    }

    static var allTests = [
        ("testPipe", testPipe)
    ]
}
