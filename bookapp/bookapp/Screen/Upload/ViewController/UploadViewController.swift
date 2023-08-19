//
//  UploadViewController.swift
//  bookapp
//
//  Created by abdul karim on 18/08/23.
//

import UIKit
import UniformTypeIdentifiers

class UploadViewController: UIViewController {
    
    @IBOutlet weak var bReadButton: UIButton!
    @IBOutlet weak var bUploadButton: UIButton!
    weak var mainCoordinator:MainCoordinator?
    
    var viewModel:UploadViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargets()
        updateUI()
        handleViewState()
    }
    
    fileprivate func handleViewState() {
        viewModel.stateDidChange = { [weak self] state in
            switch state {
            case .loading:
                debugPrint("Loading..")
            case .success:
                self?.updateUI()
            case .error(let error):
                debugPrint("Handle error - \(error.localizedDescription)")
            }
        }
    }
    
    fileprivate func addTargets() {
        bReadButton.addTarget(self, action: #selector(handleReadAction), for: .touchUpInside)
        bUploadButton.addTarget(self, action: #selector(handleUploadAction), for: .touchUpInside)
    }
    
    fileprivate func updateUI() {
        bReadButton.isEnabled = viewModel.updateReadButton()
    }
    
    @objc func handleReadAction() {
        if let selectedTextFile = viewModel?.selectedTextFile {
            mainCoordinator?.showReadViewController(dataModel: selectedTextFile)
        }
    }
    
    @objc func handleUploadAction() {
        let documentPicker = UIDocumentPickerViewController(documentTypes: ["public.text"], in: .open)
        documentPicker.delegate = self
        documentPicker.allowsMultipleSelection = false
        documentPicker.shouldShowFileExtensions = true
        present(documentPicker, animated: true, completion: nil)
    }
}

// MARK: UIDocumentPickerDelegate
extension UploadViewController : UIDocumentPickerDelegate {
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        for url in urls {
            if url.pathExtension == DefaultFileFormate {
                viewModel.updateModel(url: url)
            }
        }
    }
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
       debugPrint("User cancel the process")
    }
}
