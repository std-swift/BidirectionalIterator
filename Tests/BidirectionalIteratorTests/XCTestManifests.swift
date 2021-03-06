#if !canImport(ObjectiveC)
import XCTest

extension GeneratorTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__GeneratorTests = [
        ("testAdvance", testAdvance),
        ("testAdvanceBy", testAdvanceBy),
        ("testForEach", testForEach),
        ("testNext", testNext),
        ("testNextCount", testNextCount),
        ("testPeek", testPeek),
        ("testPeekCount", testPeekCount),
        ("testPeekPrevious", testPeekPrevious),
        ("testPeekPreviousCount", testPeekPreviousCount),
        ("testPrevious", testPrevious),
        ("testPreviousCount", testPreviousCount),
        ("testRemaining", testRemaining),
        ("testReverse", testReverse),
        ("testReverseBy", testReverseBy),
        ("testSeen", testSeen),
    ]
}

public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(GeneratorTests.__allTests__GeneratorTests),
    ]
}
#endif
