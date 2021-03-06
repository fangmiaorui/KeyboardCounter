//
//  AppDelegate.swift
//  KeyboardCounter
//
//  Created by Fang on 2020/8/13.
//

import Cocoa
import SwiftUI

@NSApplicationMain

class AppDelegate: NSObject, NSApplicationDelegate {
    
    var window: NSWindow!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        // Create the window and set the content view.
//        window = NSWindow(
//            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
//            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
//            backing: .buffered, defer: false)
//        window.isReleasedWhenClosed = false
//        window.center()
//        window.setFrameAutosaveName("Main Window")
//        window.contentView = NSHostingView(rootView: contentView)
//        window.makeKeyAndOrderFront(nil)
        let launcherAppIdentifier = "com.example.KeyboardCounter.helper"
        
        var startedAtLogin = false
        for app in NSWorkspace.shared.runningApplications {
            if app.bundleIdentifier == launcherAppIdentifier {
                startedAtLogin = true
                break
            }
        }
        
        if startedAtLogin {
            DistributedNotificationCenter.default().postNotificationName(NSNotification.Name(rawValue: "killHelper"), object: Bundle.main.bundleIdentifier!, userInfo: nil, options: .deliverImmediately)
        }
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
        print("\(aNotification)")
    }


}

