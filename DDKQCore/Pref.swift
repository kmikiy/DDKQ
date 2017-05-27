//
//  Pref.swift
//  DDKQ
//
//  Created by Miklós Kristyán on 2017. 05. 27..
//  Copyright © 2017. Miklós Kristyán. All rights reserved.
//

import Foundation


struct UserPreferences {
    
    private static let _currentQuoteNrConst = "currentQuoteNr"
    private static let _lastQuoteDayConst = "lastQuoteDay"
    
    private static var _currentQuoteNr: Int = 0
    private static var _lastQuoteDay: Date = Date.init()
  
    
    static func clearAllSettings() {
        print("clearing user settings")
        if let bundle = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundle)
        }
    }
    
    static func readPrefs(){
        _currentQuoteNr = UserDefaults.standard.integer(forKey: _currentQuoteNrConst)
        _lastQuoteDay = UserDefaults.standard.object(forKey: _lastQuoteDayConst) as! Date
    }
    
    static var currentQuoteNr: Int {
        get {
            return _currentQuoteNr
        }
        set {
            _currentQuoteNr = newValue
            UserDefaults.standard.set(newValue, forKey: _currentQuoteNrConst)
        }
    }
    
    static var lastQuoteDay: Date {
        get {
            return _lastQuoteDay
        }
        set {
            _lastQuoteDay = newValue
            UserDefaults.standard.set(newValue, forKey: _lastQuoteDayConst)
        }
    }
    

}

