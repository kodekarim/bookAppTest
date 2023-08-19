//
//  UploadUnitTest.swift
//  bookappTests
//
//  Created by abdul karim on 19/08/23.
//

import XCTest
@testable import bookapp

final class UploadUnitTest: XCTestCase {
    
    var viewModel:UploadViewModel!

    override func setUpWithError() throws {
        viewModel = UploadViewModel()
    }

    override func tearDownWithError() throws {
       viewModel = nil
    }

    func testReadButton_enable() throws {
        viewModel.selectedTextFile = TextFileModel(content: "hello", filename: "test")
        let result = viewModel.updateReadButton()
        XCTAssertTrue(result)
    }
    
    func testReadButton_disbale()  throws {
        viewModel.selectedTextFile = TextFileModel(content: "", filename: "test")
        let result = viewModel.updateReadButton()
        XCTAssertFalse(result)
    }
    
    func testUpdateModelWithValidURL() {
        let bundle = Bundle(for: type(of: self))
        if let fileURL = bundle.url(forResource: "sample", withExtension: "txt") {
            viewModel.updateModel(url: fileURL)
            
            XCTAssertEqual(viewModel.selectedTextFile?.filename, "sample.txt")
            XCTAssertEqual(viewModel.selectedTextFile?.content, "Hello, this is a sample text file.")
        }else {
            XCTAssertNil(viewModel.selectedTextFile)
        }
    }
    
    func testUpdateModelWithInvalidURL() {
        let invalidURL = URL(string: "invalid")!
        viewModel.updateModel(url: invalidURL)
        XCTAssertNil(viewModel.selectedTextFile)
    }

}
