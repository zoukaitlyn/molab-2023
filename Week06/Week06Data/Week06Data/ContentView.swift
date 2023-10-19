//
//  ContentView.swift
//  Week06Data
//
//  tutorial https://www.youtube.com/watch?v=J06P6AMKo5Q
//  colors.json from https://www.sitepoint.com/colors-json-example/


import SwiftUI

struct ContentView: View {
    private var color: [Color] = Color.allColors
    
    var body: some View {
        NavigationView{
            List{
                ForEach(color, id: \.name){ color in
                    Text("\(color.name)")
                }
            }
            .navigationTitle("Colors")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
