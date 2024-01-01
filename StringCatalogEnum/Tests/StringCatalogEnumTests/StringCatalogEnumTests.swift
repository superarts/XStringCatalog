import Nimble
import Quick
import StringCatalogEnumLibrary

final class StringCatalogEnumSpec: QuickSpec {
    override class func spec() {
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
            }

            it("can decode the json data with English translation and pluralism manually added") {
                let json = """
                {
                    "sourceLanguage" : "en",
                    "strings" : {
                        "%11d Books" : {
                            "extractionState" : "manual",
                            "localizations" : {
                                "en" : {
                                    "variations" : {
                                        "plural" : {
                                            "one" : {
                                                "stringUnit" : {
                                                    "state" : "translated",
                                                    "value" : "Book"
                                                }
                                            },
                                            "other" : {
                                                "stringUnit" : {
                                                    "state" : "translated",
                                                    "value" : "%11d Books"
                                                }
                                            }
                                        }
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
        }
    }
}

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
    }
}
