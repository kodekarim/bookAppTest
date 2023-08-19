//
//  Coordinator.swift
//  bookapp
//
//  Created by abdul karim on 18/08/23.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinator : [Coordinator] { get }
    var navigationController : UINavigationController { get }
    
    func startCoordinator()
}

class MainCoordinator : Coordinator {
    var childCoordinator: [Coordinator] = []
    var navigationController = UINavigationController()
    
    func startCoordinator() {
        let initialViewController = UploadViewController()
        initialViewController.mainCoordinator = self
        
        initialViewController.viewModel = UploadViewModel()
        initialViewController.navigationItem.title = "Hello 📚"
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.pushViewController(initialViewController, animated: false)
    }
    
    func showReadViewController(dataModel:TextFileModel) {
        let readViewController = ReadViewController()
        readViewController.viewModel = ReadViewModel.init(model: dataModel)
        let settingsButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(openEditSettings))
        readViewController.navigationItem.rightBarButtonItems = [settingsButton]
        navigationController.pushViewController(readViewController, animated: true)
    }
    
    @objc func openEditSettings() {
        if let topViewController = navigationController.viewControllers.last {
            let editViewController = EditViewController()
            editViewController.editDelegate = topViewController as? any EditViewDelegate
            if let sheet = editViewController.sheetPresentationController {
                sheet.detents = [ .medium()]
                sheet.prefersGrabberVisible = true
            }
            navigationController.present(editViewController, animated: true)
        }

    }
}
