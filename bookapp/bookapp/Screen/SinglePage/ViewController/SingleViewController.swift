//
//  SingleViewController.swift
//  bookapp
//
//  Created by abdul karim on 19/08/23.
//

import UIKit

class SingleViewController: UIViewController {

    @IBOutlet weak var lContentLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        refreshUI()
    }
    
    
    func refreshUI() {
        let fontSize = UserSettings.fontSize
        lContentLabel.font = UIFont(name: lContentLabel.font.fontName, size: fontSize)
        
        let lineSpace = UserSettings.lineSpace
        lContentLabel.spacing = lineSpace
    }
}

extension SingleViewController: ViewFromNib {}
