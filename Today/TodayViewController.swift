//
//  TodayViewController.swift
//  Today
//
//  Created by Miklós Kristyán on 2017. 05. 27..
//  Copyright © 2017. Miklós Kristyán. All rights reserved.
//

import Cocoa
import NotificationCenter
import DDKQCore

class TodayViewController: NSViewController, NCWidgetProviding {

    override var nibName: String? {
        return "TodayViewController"
    }

    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Update your data and prepare for a snapshot. Call completion handler when you are done
        // with NoData if nothing has changed or NewData if there is new data since the last
        // time we called you
        Quotes.getQuotes(){_ in
            completionHandler(.noData)
        }
   
    }

}