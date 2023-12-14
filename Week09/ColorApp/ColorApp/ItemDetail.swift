//
//  ItemDetail.swift
//  ColorApp
//
// shade/tint formulas: https://stackoverflow.com/questions/6615002/given-an-rgb-value-how-do-i-create-a-tint-or-shade
// https://maketintsandshades.com/about


import SwiftUI

struct ItemDetail: View {
    let item: JColor
     
    var body: some View {
        ScrollView{
            
            
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color(red: Double(item.r/255), green: Double(item.g/255), blue: Double(item.b/255)))
                        .frame(width: 350, height: 200)
                    HStack{
                        VStack(alignment: .leading){
                            Text(item.name)
                                .font(.system(size: 40))
                                .padding(5)
                                .foregroundStyle(.white)
                                .background(Color.black.opacity(0.2))
                                .cornerRadius(9)
                            
                        }
                        .padding(.top, 120)
                        .padding(.leading, 35)
                        Spacer()
                    }
                    
                }
                
                VStack(alignment: .leading){
                    Text("Category: " + item.category)
                        .padding(.top, 5)
                    Text("Type: " + item.type)
                        .padding(.top, 5)
                    Text("Hex: " + item.hex)
                        .padding(.top, 5)
                    Text("Rgba: (\(item.r), \(item.g), \(item.b), \(item.a))")
                        .padding(.top, 5)
                        .padding(.bottom, 10)
                    
                    Text("Complement: (\(255-item.r), \(255-item.g), \(255-item.b))")
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color(red: Double(255-item.r), green: Double(255-item.g), blue: Double(255-item.b)))
                        .frame(width: 350, height: 50)
                        .padding(.bottom, 10)
                    
                    Text("Shade Gradient")
                    HStack{
                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color(red: Double(item.r)/255.0, green: Double(item.g)/255.0, blue: Double(item.b)/255.0))
                            .frame(width: 50, height: 50)
                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color(red: Double(item.r) * 0.9 / 255.0, green: Double(item.g) * 0.9 / 255.0, blue: Double(item.b) * 0.9 / 255.0))
                            .frame(width: 50, height: 50)
                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color(red: Double(item.r) * 0.7 / 255.0, green: Double(item.g) * 0.7 / 255.0, blue: Double(item.b) * 0.7 / 255.0))
                            .frame(width: 50, height: 50)
                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color(red: Double(item.r) * 0.5 / 255.0, green: Double(item.g) * 0.5 / 255.0, blue: Double(item.b) * 0.5 / 255.0))
                            .frame(width: 50, height: 50)
                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color(red: Double(item.r) * 0.3 / 255.0, green: Double(item.g) * 0.3 / 255.0, blue: Double(item.b) * 0.3 / 255.0))
                            .frame(width: 50, height: 50)
                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color(red: Double(item.r) * 0.1 / 255.0, green: Double(item.g) * 0.1 / 255.0, blue: Double(item.b) * 0.1 / 255.0))
                            .frame(width: 50, height: 50)
                    }
                    .padding(.bottom, 10)
                    
                    Text("Tint Gradient")
                    //                newR = currentR + (255 - currentR) * tint_factor
                    HStack{
                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color(red: Double(item.r)/255.0, green: Double(item.g)/255.0, blue: Double(item.b)/255.0))
                            .frame(width: 50, height: 50)
                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color(red: Double(item.r + Int(Double((255 - item.r)) * 0.1)) / 255.0,
                                        green: Double(item.g + Int(Double((255 - item.g)) * 0.1)) / 255.0,
                                        blue: Double(item.b + Int(Double((255 - item.b)) * 0.1)) / 255.0))
                            .frame(width: 50, height: 50)
                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color(red: Double(item.r + Int(Double((255 - item.r)) * 0.3)) / 255.0,
                                        green: Double(item.g + Int(Double((255 - item.g)) * 0.3)) / 255.0,
                                        blue: Double(item.b + Int(Double((255 - item.b)) * 0.3)) / 255.0))
                            .frame(width: 50, height: 50)
                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color(red: Double(item.r + Int(Double((255 - item.r)) * 0.5)) / 255.0,
                                        green: Double(item.g + Int(Double((255 - item.g)) * 0.5)) / 255.0,
                                        blue: Double(item.b + Int(Double((255 - item.b)) * 0.5)) / 255.0))
                            .frame(width: 50, height: 50)
                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color(red: Double(item.r + Int(Double((255 - item.r)) * 0.7)) / 255.0,
                                        green: Double(item.g + Int(Double((255 - item.g)) * 0.7)) / 255.0,
                                        blue: Double(item.b + Int(Double((255 - item.b)) * 0.7)) / 255.0))
                            .frame(width: 50, height: 50)
                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color(red: Double(item.r + Int(Double((255 - item.r)) * 0.9)) / 255.0,
                                        green: Double(item.g + Int(Double((255 - item.g)) * 0.9)) / 255.0,
                                        blue: Double(item.b + Int(Double((255 - item.b)) * 0.9)) / 255.0))
                            .frame(width: 50, height: 50)
                    }
                    
                    Spacer()
                    
                }
                .frame(width: 300)
                
            }
        }
        
    }
}

#Preview {
    ItemDetail(item: JColor.example)
}


