//
//  ItemDetail.swift
//  Week06Data
//
//  Created by Kaitlyn Zou on 10/23/23.
//

import SwiftUI

struct ItemDetail: View {
    let item: Color

    var body: some View {
//        let k = UIColor(red: CGFloat(242) / 255, green: CGFloat(242) / 255, blue: CGFloat(242) / 255, alpha: CGFloat(255) / 255)
//        var myCol: Color
        VStack{
            if(item.name == "red"){
                Circle()
                    .fill(.red)
                    .frame(width: 400, height: 250)
            } else if(item.name == "black"){
                Circle()
                    .fill(.black)
                    .frame(width: 400, height: 250)
            } else if(item.name == "white"){
                Circle()
                    .strokeBorder(.black, lineWidth: 3)
                    .background(Circle().fill(.white))
                    .frame(width: 400, height: 250)
            } else if(item.name == "blue"){
                Circle()
                    .fill(.blue)
                    .frame(width: 400, height: 250)
            } else if(item.name == "yellow"){
                Circle()
                    .fill(.yellow)
                    .frame(width: 400, height: 250)
            } else if(item.name == "green"){
                Circle()
                    .fill(.green)
                    .frame(width: 400, height: 250)
            }
            
//            Circle()
//            Circle().fill(Color(k))
//                .foregroundStyle(.red)
//                .foregroundColor()
//                .fill(Color(red: 242, green: 242, blue: 242))
//                .fill(Color(red: item.r/255, green: item.g/255, blue: item.b/255))
//                .foreground(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
//                .fill(Color.red)
//                .frame(width: 400, height: 250)
            
            VStack(alignment: .leading){
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
//            .frame(width: 300)
            
            
            if(item.name == "red"){
//                List {
                    ImageSliderView()
                        .frame(width: 300, height: 200)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
//                }
            }
            
            
            Spacer()
            
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)


    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ItemDetail(item: Color.example)

        }
    }
}
