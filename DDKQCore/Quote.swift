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

public class Quotes {
    public static func getQuotes( completion: (_ quotes: [String])->()) {
        Alamofire.request("https://raw.githubusercontent.com/kmikiy/DDKQ/master/quotes.json").responseJSON { response in
            if let value = response.result.value {
                let swiftyJsonVar = JSON(value)
                print(swiftyJsonVar.arrayValue.map { $0.stringValue})
            }
            
        }
    }
}

