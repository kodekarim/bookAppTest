//
//  ReadViewModel.swift
//  bookapp
//
//  Created by abdul karim on 19/08/23.
//

import Foundation
import UIKit

class ReadViewModel {
    
    var textModel:TextFileModel?
    var pages: [UIViewController] = []

    //ui state 
    enum ReadListState {
        case loading
        case success
        case error
    }
    var stateDidChange: ((ReadListState) -> Void)?
    var state: ReadListState = .loading {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.stateDidChange?(self?.state ?? .loading)
            }
        }
    }
    
    init(model:TextFileModel) {
        self.textModel = model
    }
    
    func setup() {
        state = .loading
        let inputParagraph = textModel?.content ?? ""
        let maxWordsPerString = 200
        let resultStrings = splitTextIntoStrings(inputParagraph, maxWordsPerString: maxWordsPerString)
        for (_, string) in resultStrings.enumerated() {
            let page = createPage(with: string)
            pages.append(page)
        }
        
        if resultStrings.count != pages.count {
            state = .error
        }else {
            state = .success
        }

    }
    
    func splitTextIntoStrings(_ paragraph: String, maxWordsPerString: Int) -> [String] {
        let words = paragraph.components(separatedBy: .whitespacesAndNewlines).filter { !$0.isEmpty }
        
        var resultStrings: [String] = []
        
        for index in stride(from: 0, to: words.count, by: maxWordsPerString) {
            let endIndex = min(index + maxWordsPerString, words.count)
            let currentWords = words[index..<endIndex]
            let currentString = currentWords.joined(separator: " ")
            resultStrings.append(currentString)
        }
        
        return resultStrings
    }
    
    func createPage(with text: String) -> UIViewController {
        let page = SingleViewController()
        page.view.backgroundColor = .white
        page.lContentLabel.text = text
        return page
    }
    
    func preferredFontWithCustomSize(for textStyle: UIFont.TextStyle, customSize: CGFloat) -> UIFont {
        let font = UIFont.preferredFont(forTextStyle: textStyle)
        let fontDescriptor = font.fontDescriptor.withSize(customSize)
        return UIFont(descriptor: fontDescriptor, size: customSize)
    }
}
