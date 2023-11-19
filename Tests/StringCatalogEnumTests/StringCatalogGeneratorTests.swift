//
//  StringCatalogGeneratorTests.swift
//  
//
//  Created by Mac on 19/11/2023.
//

import XCTest

class StringCatalogGeneratorTests: XCTestCase {


    func testGenerateEnum() throws {
        // Create a temporary directory for test files
        let temporaryDirectoryURL = URL(fileURLWithPath: NSTemporaryDirectory())
        let testXcstringsPath = temporaryDirectoryURL.appendingPathComponent("testXcstrings.json")
        let testOutputFilename = temporaryDirectoryURL.appendingPathComponent("testOutput.swift")

        let json = """
        {
            "strings": {
                "key1": "value1",
                "key2": "value2",
                "key3": "value3"
            }
        }
        """.data(using: .utf8)!
        try json.write(to: testXcstringsPath)

        try StringCatalogGenerator.generateEnum(from: testXcstringsPath.path, outputFilename: testOutputFilename.path)


        try FileManager.default.removeItem(at: testXcstringsPath)
        try FileManager.default.removeItem(at: testOutputFilename)
    }

}
