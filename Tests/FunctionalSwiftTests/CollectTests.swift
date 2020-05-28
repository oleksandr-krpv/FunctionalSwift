import XCTest
@testable import FunctionalSwift

final class CollectTests: XCTestCase {
    func testVoidCollect() {
        var count = 0
        func a() {
            count += 1
        }
        func b() {
            count += 1
        }
        func c() {
            count += 1
        }
        collect(a, b, c)()
        XCTAssertEqual(count, 3)
    }
    
    func testArgCollect() {
        var counter = Counter()
        
        func a(arg: Counter) {
            counter.count += 1
        }
        
        func b(arg: Counter) {
            counter.count += 1
        }
        
        func c(arg: Counter) {
            counter.count += 1
        }
        
        collect(a,b,c)(counter)
        XCTAssertEqual(counter.count, 3)
    }

    static var allTests = [
        ("testVoidCollect", testVoidCollect),
        ("testArgCollect", testArgCollect),
    ]
}
