import Nimble
import Quick
import StringCatalogEnumLibrary

final class StringCatalogEnumSpec: QuickSpec {
    override class func spec() {
        context("StringCatalogEnum") {
            describe("Example") {
                it("should be replaced") {
                    expect(true).toNot(equal(false))
                }
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
