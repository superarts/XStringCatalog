import Nimble
import Quick
@testable import StringCatalogEnum


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
        let stringKeyModel = StringEnumKeyModel()
        context("StringKeyModel") {
            describe("Convert To Variable Name Function") {
                
                it("Basic cases should convert properly"){
                    // Basic test cases
                    expect(stringKeyModel.convertToVariableName(key: "SomeKey")).to(equal("someKey"))
                    expect(stringKeyModel.convertToVariableName(key: "123Key")).to(equal("key"))
                    // Test cases with special characters
                    expect(stringKeyModel.convertToVariableName(key: "Special!@#$%^&*()Key")).to(equal("specialKey"))
                    
                    // Test cases with mixed case
                    expect(stringKeyModel.convertToVariableName(key: "MixedCaseKey")).to(equal("mixedCaseKey"))

                    // Empty Key Case
                    expect(stringKeyModel.convertToVariableName(key: "")).to(beNil())
                }
                
                it("White Space cases should convert properly") {
                    // Test cases with spaces
                    expect(stringKeyModel.convertToVariableName(key: "Key with Spaces")).to(equal("keyWithSpaces"))

                    // Test cases with whitespaces trailing and leaading
                    expect(stringKeyModel.convertToVariableName(key: "  whitespace  ")).to(equal("whitespace"))
                }
                
                it("Auto CamelCase for character after white space") {
                    expect(stringKeyModel.convertToVariableName(key: "an example")).to(equal("anExample"))
                }
                it("Should lowercase all capitalized keys") {
                    expect(stringKeyModel.convertToVariableName(key: "EXAMPLE")).to(equal("example"))
                }
            }
        }
    }
}
