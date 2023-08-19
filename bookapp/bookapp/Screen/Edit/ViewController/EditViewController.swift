//
//  EditViewController.swift
//  bookapp
//
//  Created by abdul karim on 19/08/23.
//

import UIKit

protocol EditViewDelegate:AnyObject {
    func handleFontSize(stepper:UIStepper)
    func hanleLineSpace(stepper:UIStepper)
}

class EditViewController: UIViewController {

    @IBOutlet weak var sFontSizeStepper: UIStepper!
    @IBOutlet weak var sLineSpaceStepper: UIStepper!
    
    weak var editDelegate:EditViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTarget()
    }
    
    fileprivate func addTarget() {
        sFontSizeStepper.addTarget(self, action: #selector(handleFontSize), for: .valueChanged)
        sLineSpaceStepper.addTarget(self, action: #selector(handleLineSpace), for: .valueChanged)
    }
    
    @objc fileprivate func handleFontSize() {
        editDelegate?.handleFontSize(stepper: sFontSizeStepper)
    }
    
    @objc fileprivate func handleLineSpace() {
        editDelegate?.hanleLineSpace(stepper: sLineSpaceStepper)
    }
}

extension EditViewController : ViewFromNib {}
