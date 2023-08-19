//
//  UploadViewModel.swift
//  bookapp
//
//  Created by abdul karim on 19/08/23.
//

import Foundation

class UploadViewModel {
    var selectedTextFile: TextFileModel?
    
    //state property
    enum ViewState {
        case loading
        case success
        case error(Error)
    }
    var stateDidChange: ((ViewState) -> Void)?
    
    var state: ViewState = .loading {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.stateDidChange?(self?.state ?? .loading)
            }
        }
    }
    
    func updateReadButton() -> Bool {
        if selectedTextFile?.content.isEmpty == true || selectedTextFile?.content == "" {
            return false
        }
        return selectedTextFile == nil  ? false : true
    }
    
    func updateModel(url:URL) {
        state = .loading
        do {
            let text = try String(contentsOf: url)
            selectedTextFile = TextFileModel(content: text, filename: url.lastPathComponent)
            state = .success
        }
        catch {
            debugPrint("Error reading file: \(error)")
            state = .error(error)
        }
    }
}
