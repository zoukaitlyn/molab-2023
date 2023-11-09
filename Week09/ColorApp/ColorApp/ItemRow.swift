//
//  ItemRow.swift
//  ColorApp
//
//

import SwiftUI

struct ItemRow: View {
    let item: JColor
    
    var body: some View {
        HStack{
            Circle()
                .fill(Color(red: Double(item.r/255), green: Double(item.g/255), blue: Double(item.b/255)))
                .frame(width: 50, height: 80)

            VStack(alignment: .leading){
                Text(item.name)
                    .font(.headline)
                Text(item.category + ", " + item.type)

            }
            Spacer()

        }
        
        
    }
}

#Preview {
    ItemRow(item: JColor.example)
}
