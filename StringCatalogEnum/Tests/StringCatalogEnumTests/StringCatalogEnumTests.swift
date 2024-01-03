import Nimble
import Quick
import StringCatalogEnumLibrary
import Foundation

/// Tests the convertToVariableName() function in StringKeyModel
final class StringKeyModelSpec: QuickSpec {
    override class func spec() {
        let stringEnumHelper = StringEnumHelper()

        context("StringKeyModel") {
            describe("Convert To Variable Name Function") {
                it("Basic cases should convert properly") {
                    // Basic test cases
                    expect(stringEnumHelper.convertToVariableName(key: "SomeKey")).to(equal("someKey"))
                    expect(stringEnumHelper.convertToVariableName(key: "123Key")).to(equal("key"))

                    // Test cases with special characters
                    expect(stringEnumHelper.convertToVariableName(key: "Special!@#$%^&*()Key")).to(equal("specialKey"))

                    // Test cases with mixed case
                    expect(stringEnumHelper.convertToVariableName(key: "MixedCaseKey")).to(equal("mixedCaseKey"))

                    // Empty Key Case
                    expect(stringEnumHelper.convertToVariableName(key: "")).to(beNil())
                }
                it("White Space cases should convert properly") {
                    // Test cases with spaces
                    expect(stringEnumHelper.convertToVariableName(key: "Key with Spaces")).to(equal("keyWithSpaces"))

                    // Test cases with whitespaces trailing and leaading
                    expect(stringEnumHelper.convertToVariableName(key: "  whitespace  ")).to(equal("whitespace"))
                }
                it("Auto CamelCase for character after white space") {
                    expect(stringEnumHelper.convertToVariableName(key: "an example")).to(equal("anExample"))
                }
                it("Should lowercase all capitalized keys") {
                    expect(stringEnumHelper.convertToVariableName(key: "EXAMPLE")).to(equal("example"))
                }
            }
        }

        describe("a decodable model") {
            it("can decode the json data with key only") {
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
                    try decoder.decode(Localizations.self, from: jsonData)
                }.toNot(throwError())
            }

            it("can decode the json data with English translation added") {
                let json = """
                {
                    "sourceLanguage" : "en",
                    "strings" : {
                        "Login" : {
                            "localizations" : {
                                "en" : {
                                    "stringUnit" : {
                                        "state" : "translated",
                                        "value" : "Login"
                                    }
                                }
                            }
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
                    try decoder.decode(Localizations.self, from: jsonData)
                }.toNot(throwError())
            }

            it("can decode the json data with English translation manually added") {
                let json = """
                {
                    "sourceLanguage" : "en",
                    "strings" : {
                        "welcomeBack" : {
                            "extractionState" : "manual",
                            "localizations" : {
                                "en" : {
                                    "stringUnit" : {
                                        "state" : "translated",
                                        "value" : "Welcome back"
                                    }
                                }
                            }
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
                    try decoder.decode(Localizations.self, from: jsonData)
                }.toNot(throwError())

                // To complete this test, we should change all the structs and their attributes to be public
                // Verify the decoded data
                // if let decodedData = try? decoder.decode(Localizations.self, from: jsonData) {
                //     // Verify sourceLanguage
                //     expect(decodedData.sourceLanguage).to(equal("en"))

                //     // Verify version
                //     expect(decodedData.version).to(equal("1.0"))

                //     // Verify the contents of 'strings' dictionary
                //     expect(decodedData.strings["welcomeBack"]).toNot(beNil())
                //     expect(decodedData.strings["welcomeBack"]?.extractionState).to(equal("manual"))
                //     expect(decodedData.strings["welcomeBack"]?.localizations?["en"]?.stringUnit?.state).to(equal("translated"))
                //     expect(decodedData.strings["welcomeBack"]?.localizations?["en"]?.stringUnit?.value).to(equal("Welcome back"))
                // } else {
                //     fail("JSON data could not be decoded")
                // }
            }
        }
    }
}
