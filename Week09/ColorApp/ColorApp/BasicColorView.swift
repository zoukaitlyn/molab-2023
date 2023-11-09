//
//  BasicColorView.swift
//  ColorApp
//
//

import SwiftUI

struct BasicColorView: View {
    private var color: [JColor] = JColor.allColors

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
            .navigationTitle("Basic colors")
            .navigationDestination(for: JColor.self){ item in
            ItemDetail(item: item)
                    
            }
        }
    }
}

#Preview {
    BasicColorView()
}
