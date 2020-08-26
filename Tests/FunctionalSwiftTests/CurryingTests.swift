import XCTest
@testable import FunctionalSwift

final class CurringTests: XCTestCase {
    func testArgumentlessCurrying() {
        let counter = Counter()
        
        func process(counter: Counter) {
            counter.count += 1
        }
        
        curry(process(counter:), argument: counter)()
        XCTAssertEqual(counter.count, 1)
    }
    
    func testSingleArgumentCurrying() {
        let counter = Counter()
        let increment = 1
        
        func process(counter: Counter, increment: Int) {
            counter.count += increment
        }
        
        curry(process(counter:increment:), argument: counter)(increment)
        XCTAssertEqual(counter.count, increment)
    }

    static var allTests = [
        ("testArgumentlessCurrying", testArgumentlessCurrying),
        ("testSingleArgumentCurrying", testSingleArgumentCurrying)
    ]
}
