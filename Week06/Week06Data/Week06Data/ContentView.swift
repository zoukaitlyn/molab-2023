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
        NavigationStack{
            List{
                ForEach(color, id: \.name){ color in
                    NavigationLink(value: color){
                        ItemRow(item: color)
                    }
                }
                .padding(15)

            }
            .navigationTitle("Colors")
            .navigationDestination(for: Color.self){ item in
            ItemDetail(item: item)
                    
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
