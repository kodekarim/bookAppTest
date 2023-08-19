//
//  UILableExtension.swift
//  bookapp
//
//  Created by abdul karim on 19/08/23.
//

import Foundation
import UIKit

extension UILabel {
    var spacing: CGFloat {
        get {return 1}
        set {
            let textAlignment = self.textAlignment
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = newValue
            let attributedString = NSAttributedString(string: self.text ?? "", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
            self.attributedText = attributedString
            self.textAlignment = textAlignment
        }
    }
}
