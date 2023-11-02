//
//  Week06DataApp.swift
//  Week06Data
//
//

import SwiftUI

@main
struct Week06DataApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                ContentView()
                    .tabItem {
                        Label("Received", systemImage: "tray.and.arrow.down.fill")
                    }
                
            }
        }
    }
}
