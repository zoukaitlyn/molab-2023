//
//  iDineTutorialApp.swift
//  iDineTutorial
//
//  Created by Kaitlyn Zou on 10/18/23.
//

import SwiftUI

@main
struct iDineTutorialApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
