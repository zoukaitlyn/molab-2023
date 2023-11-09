//
//  ContentView.swift
//  ColorApp
//
//  Created by Kaitlyn Zou on 11/7/23.
//

import SwiftUI

struct ContentView: View {
    private var color: [JColor] = JColor.allColors

    var body: some View {
        TabView{
            AllColorsView()
                .tabItem {
                    Label("All", systemImage: "circle.fill")
                }
            BasicColorView()
                .tabItem {
                    Label("Basic", systemImage: "heart.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
