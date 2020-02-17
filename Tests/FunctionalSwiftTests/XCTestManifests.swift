import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(FunctionalSwiftTests.allTests),
    ]
}
#endif
