//
//  UserDefaultsHelper.swift
//  JokerApp
//
//  Created by Abhishek Singh on 02/10/23.
//

import UIKit

enum AppUserDefaults {
    
    static func value(forKey key: Key,
                      file : String = #file,
                      line : Int = #line,
                      function : String = #function) -> [String] {
        
        guard let value = UserDefaults.standard.object(forKey: key.rawValue) as? [String] else {
            print("No Value Found in UserDefaults\nFile : \(file) \nLine Number : \(line) \nFunction : \(function)")
            return []
        }
        
        return value
    }
        
    static func save(value : Any, forKey key : Key) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    static func removeValue(forKey key : Key) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
        UserDefaults.standard.synchronize()
    }
        
    static func removeAllValues() {
        let appDomain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: appDomain)
        UserDefaults.standard.synchronize()
    }
}

//MARK: Keys
extension AppUserDefaults {
    
    enum Key : String {
        case jokes
    }
}
