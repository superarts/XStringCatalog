import XCTest

#if !canImport(ObjectiveC)
    public func allTests() -> [XCTestCaseEntry] {
        [
            testCase(StringCatalogEnumTests.allTests),
        ]
    }
#endif
