//
//  ColorHistoryDetail.swift
//  ColorApp
//
//

import SwiftUI

struct ColorHistoryDetail: View {
    let item: ColorHistoryFact
    
    let colorHistory: ColorHistory = [
            ColorHistoryFact(name: "Red", hex: "FF0000", fact: "Cochineal is a pigment of red..."),
            // Add more ColorHistoryFact instances as needed
        ]
    
    
    var body: some View {
//        let k: ColorHistory.randomElement()
        
        
        ZStack{
            RoundedRectangle(cornerRadius: 9)
                .fill(Color(hex: item.hex))
                .frame(width: 350, height: 300)
            VStack{
                Spacer()
                Text(item.fact)
                    .foregroundStyle(.white)

                HStack{
                    ZStack{
                        Text(item.name)
                            .font(.headline)
                            .padding(10)
                            .foregroundStyle(.white)
                            .background(Color.black.opacity(0.2))
                            .cornerRadius(9)
                    }
                    Spacer()
                }
                
            }
            .frame(width: 320, height: 300)
            .padding(.bottom, 30)
        }
    }
}

#Preview {
    ColorHistoryDetail(item: ColorHistoryFact.example)
}
