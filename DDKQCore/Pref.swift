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
        private static let _lastQuoteStringConst = "lastQuoteString"
    
    
    private static var _currentQuoteNr: Int = 0
    private static var _lastQuoteDay: Date = Date.init()
    private static var _lastQuoteString: String = "Congratulations. You played yourself."
    
    private static let _hasBeenInited = "hasBeenInited"
    
    static func clearAllSettings() {
        print("clearing user settings")
        if let bundle = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundle)
        }
    }
    
    static func readPrefs(){
        let hasBeenInited = UserDefaults.standard.bool(forKey: _hasBeenInited)
        if !hasBeenInited {
            UserDefaults.standard.set(true, forKey: _hasBeenInited)
            currentQuoteNr = _currentQuoteNr
            lastQuoteDay = _lastQuoteDay
            lastQuoteString = _lastQuoteString
        }
        _currentQuoteNr = UserDefaults.standard.integer(forKey: _currentQuoteNrConst)
        _lastQuoteDay = UserDefaults.standard.object(forKey: _lastQuoteDayConst) as! Date
        _lastQuoteString = UserDefaults.standard.string(forKey: _lastQuoteStringConst)!
    }
    
    public static var currentQuoteNr: Int {
        get {
            return _currentQuoteNr
        }
        set {
            _currentQuoteNr = newValue
            UserDefaults.standard.set(newValue, forKey: _currentQuoteNrConst)
        }
    }
    
    public static var lastQuoteDay: Date {
        get {
            return _lastQuoteDay
        }
        set {
            _lastQuoteDay = newValue
            UserDefaults.standard.set(newValue, forKey: _lastQuoteDayConst)
        }
    }
    
    public static var lastQuoteString: String {
        get {
            return _lastQuoteString
        }
        set {
            _lastQuoteString = newValue
            UserDefaults.standard.set(newValue, forKey: _lastQuoteStringConst)
        }
    }

}

