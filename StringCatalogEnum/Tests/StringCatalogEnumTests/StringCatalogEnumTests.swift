import Foundation
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