//
//  ContentView.swift
//  Week04Audio3
//
//  Created by Kaitlyn Zou on 10/4/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack {
                List{
                    NavigationLink (destination: Alarm1()) {
                        Text("5 Second Timer")
                    }
                    NavigationLink (destination: Alarm2()) {
                        Text("3 Second Timer")
                    }
                }
            }
            .padding()
            .navigationTitle("Countdown")
        }


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
