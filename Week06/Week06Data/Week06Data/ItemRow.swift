//
//  ItemRow.swift
//  Week06Data
//
//  Created by Kaitlyn Zou on 10/23/23.
//

import SwiftUI


struct ItemRow: View {
    let item: Color
    
    var body: some View {
        HStack{
            if(item.name == "red"){
                Circle()
                    .fill(.red)
                    .frame(width: 50, height: 50)
            } else if(item.name == "black"){
                Circle()
                    .fill(.black)
                    .frame(width: 50, height: 50)
            } else if(item.name == "white"){
                Circle()
                    .strokeBorder(.black, lineWidth: 3)
                    .background(Circle().fill(.white))
                    .frame(width: 50, height: 50)
            } else if(item.name == "blue"){
                Circle()
                    .fill(.blue)
                    .frame(width: 50, height: 50)
            } else if(item.name == "yellow"){
                Circle()
                    .fill(.yellow)
                    .frame(width: 50, height: 50)
            } else if(item.name == "green"){
                Circle()
                    .fill(.green)
                    .frame(width: 50, height: 50)
            }
            
//            Circle()
//                .fill(.red)
//                .frame(width: 50, height: 50)
            VStack(alignment: .leading){
                Text(item.name)
                    .font(.headline)
                Text(item.category + ", " + item.type)

            }
            
            
            Spacer()
            
            
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: Color.example)
    }
}
