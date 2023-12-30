import Foundation
import Nimble
import Quick

final class StringCatalogEnumSpec: QuickSpec {
    override class func spec() {
        context("StringCatalogEnum") {
            describe("XCStrings Decoding") {
                it("should decode simple key correctly") {
                    let jsonString = """
                    {
                      "strings": {
                        "Home": {}
                      }
                    }
                    """
                    let jsonData = Data(jsonString.utf8)
                    let decoder = JSONDecoder()

                    do {
                        let xcStrings = try decoder.decode(XCStrings.self, from: jsonData)
                        expect(xcStrings.strings["Home"]).toNot(beNil())
                        expect(xcStrings.strings["Home"]?.extractionState).to(beNil())
                        expect(xcStrings.strings["Home"]?.localizations.isEmpty).to(beTrue())
                    } catch {
                        fail("Decoding failed: \(error)")
                    }
                }

                // Add other test cases here in similar fashion
            }
        }
    }
}