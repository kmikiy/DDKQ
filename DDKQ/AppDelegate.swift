//
//  AppDelegate.swift
//  DDKQ
//
//  Created by Miklós Kristyán on 2017. 05. 27..
//  Copyright © 2017. Miklós Kristyán. All rights reserved.
//

import Cocoa
import DDKQCore

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        Quotes.getQuotes { _ in
            
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

