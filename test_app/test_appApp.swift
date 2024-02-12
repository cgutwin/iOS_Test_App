//
//  test_appApp.swift
//  test_app
//
//  Created by Chris Gutwin on 2024-02-11.
//

import SwiftUI
import UserNotifications

@main
struct test_appApp: App {
    init() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { 
            granted, error in
            
            if (granted) {
                print("granted notifications")
            }
            
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
