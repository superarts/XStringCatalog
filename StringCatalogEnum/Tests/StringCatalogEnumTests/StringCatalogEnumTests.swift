import Foundation
import Nimble
import Quick

final class StringCatalogEnumSpec: QuickSpec {
    override class func spec() {
        describe("a decodable model") {
            it("can decode the json data") {
                let json = """
                {
                    "sourceLanguage" : "en",
                    "strings" : {
                    "Home" : {
                    },
                },
                "version" : "1.0"
                }
                """
                guard let jsonData = json.data(using: .utf8) else {
                    fatalError("Invalid JSON string")
                }
                let decoder = JSONDecoder()
                expect{
                    try decoder.decode(XCStrings.self, from: jsonData)
                }.toNot(throwError())
            }
        }
    }
}