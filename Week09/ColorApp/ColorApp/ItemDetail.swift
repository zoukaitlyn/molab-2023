//
//  ItemDetail.swift
//  ColorApp
//
//

import SwiftUI

struct ItemDetail: View {
    let item: JColor

    
    var body: some View {
        VStack{
            Circle()
                .fill(Color(red: Double(item.r/255), green: Double(item.g/255), blue: Double(item.b/255)))
                .frame(width: 400, height: 250)
                        
            VStack(alignment: .leading){
                Text(item.name)
                    .padding(.leading, 40)

                List{
                    Text("Category: " + item.category)
                    Text("Type: " + item.type)
                    Text("Hex value: " + item.hex)
                    Text("rgba(\(item.r), \(item.g), \(item.b), \(item.a))")
                }
                .scrollContentBackground(.hidden)
                .scrollDisabled(true)
                .frame(width: 380)

            }
        }
        
    }
}

#Preview {
    ItemDetail(item: JColor.example)
}
