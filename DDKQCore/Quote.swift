//
//  quote.swift
//  DDKQ
//
//  Created by Miklós Kristyán on 2017. 05. 27..
//  Copyright © 2017. Miklós Kristyán. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import SwiftDate

public class Quotes {
    public static func getQuotes( completion: @escaping (_ quotes: [String])->()) {
        Alamofire.request("https://raw.githubusercontent.com/kmikiy/DDKQ/master/quotes.json").responseJSON { response in
            if let value = response.result.value {
                let swiftyJsonVar = JSON(value)
                let array = swiftyJsonVar.arrayValue.map { $0.stringValue}
                completion(array)
            } else {
                completion([])
            }
            
        }
    }
    
    public static var daysSinceLastQuote: Float64 {
        let lastQuoteDay = UserPreferences.lastQuoteDay
        let now = Date().startOfDay
        let delta = now.timeIntervalSince(lastQuoteDay.startOfDay)
        return Double(delta / 60 / 60 / 24)
    }
}

