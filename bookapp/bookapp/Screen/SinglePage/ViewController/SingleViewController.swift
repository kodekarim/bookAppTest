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

    
    func refreshUI(fontSize:CGFloat) {
        lContentLabel.font = UIFont(name: lContentLabel.font.fontName, size: fontSize)
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension SingleViewController: ViewFromNib {}
