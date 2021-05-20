//
//  timer_appApp.swift
//  timer-app WatchKit Extension
//
//  Created by Bikram Aryal on 20/05/2021.
//

import SwiftUI

@main
struct timer_appApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
