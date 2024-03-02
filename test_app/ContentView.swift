//
//  ContentView.swift
//  test_app
//
//  Created by Chris Gutwin on 2024-02-11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("hello notifications!")
                .onAppear {
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
                        granted, error in
                        
                        if (granted) {
                            print("granted")
                        } else {
                            print("denied")
                        }
                    }
                }
            Button("send notif") {
                sendNotification()
            }
            Button("fetchpbp") {
                NHLEdgePBPFetch().getPbp { data in
                    return
                }
            }
        }
        .padding()
    }
    
    func sendNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Hello Notifications!"
        content.body = "Notification Message"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) {
            error in
            if let error = error {
                print("error: \(error)")
            } else {
                print("scheduled")
            }
        }
    }
 }

#Preview {
    ContentView()
}
