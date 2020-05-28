import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(CollectTests.allTests),
        testCase(CombineTests.allTests),
        testCase(PipeTests.allTests),
    ]
}
#endif
