import XCTest
@testable import FunctionalSwift

final class CombineTests: XCTestCase {
    func testCombine() {
        let counter = Counter()

        func process(counter: Counter) {
            counter.count += 1
        }

        combine(counter, with: process(counter:))()
        XCTAssertEqual(counter.count, 1)
    }

    static var allTests = [
        ("testCombine", testCombine)
    ]
}
