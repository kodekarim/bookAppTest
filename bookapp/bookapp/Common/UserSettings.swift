//
//  UserSettings.swift
//  bookapp
//
//  Created by abdul karim on 19/08/23.
//

import Foundation

class UserSettings {

    private enum Keys {
        static let fontSize = "FontSize"
        static let lineSpace = "lineSpace"
    }

    static var fontSize: Double {
        get {
            return UserDefaults.standard.double(forKey: Keys.fontSize)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.fontSize)
        }
    }

    static var lineSpace: Double {
        get {
            return UserDefaults.standard.double(forKey: Keys.lineSpace)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.lineSpace)
        }
    }
}
