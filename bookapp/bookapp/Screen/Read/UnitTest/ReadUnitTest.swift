//
//  ReadUnitTest.swift
//  bookappTests
//
//  Created by abdul karim on 19/08/23.
//

import XCTest
@testable import bookapp

final class ReadUnitTest: XCTestCase {
    
    var viewModel:ReadViewModel!

    override func setUpWithError() throws {
        let textFileMockModel = TextFileModel(content: "Hello world", filename: "unit test")
        viewModel = ReadViewModel(model: textFileMockModel)
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testSplitTextIntoStrings() {
        let paragraph = """
            This is a test paragraph with some words. It should be split into strings with a maximum of 5 words each.
            """
        let maxWordsPerString = 5

        let resultStrings = viewModel.splitTextIntoStrings(paragraph, maxWordsPerString: maxWordsPerString)
        XCTAssertEqual(resultStrings.count, 5)

        let joinedResult = resultStrings.joined(separator: " ")
        XCTAssertEqual(joinedResult, paragraph) 
    }
    
    func testCreatePage() {
        let text = "Test content for the page"

        let page = viewModel.createPage(with: text)

        XCTAssertTrue(page is SingleViewController) // Check if the created page is of the expected type

        guard let singleVC = page as? SingleViewController else {
            XCTFail("Failed to cast page to SingleViewController")
            return
        }

        XCTAssertEqual(singleVC.lContentLabel.text, text) // Verify that the label's text matches the provided text
    }

}
