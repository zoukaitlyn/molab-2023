//
//  AllColorsDetail.swift
//  ColorApp
//
// https://stackoverflow.com/questions/24263007/how-to-use-hex-color-values

import SwiftUI

struct AllColorsDetail: View {
    @EnvironmentObject var collection: Collection
    let item: JColorName
    var color1 = hexStringToUIColor(hex: "#d3d3d3")
    
    var body: some View {
        VStack{
            ZStack(alignment: .leading){
                RoundedRectangle(cornerRadius: 6)
                    .fill(Color(hex: item.hex))
                    .frame(width: 350, height: 200)
                Text(item.name)
                    .padding(.top, 130)
                    .padding(.leading, 20)
                    .font(.system(size: 40))
                    .foregroundStyle(.white)
            }
            VStack(alignment: .leading){
                if let rgb = hexToRGB(hex: item.hex) {
                    Text("RGB: (\(rgb.0), \(rgb.1), \(rgb.2))")
                        .padding(.top, 5)
                    Text("Hex: \(item.hex)")
                        .padding(.top, 5)
                    Text("Complement: (\(255-rgb.0), \(255-rgb.1), \(255-rgb.2))")
                        .padding(.top, 5)
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color(red: Double(255-rgb.0)/255, green: Double(255-rgb.1)/255, blue: Double(255-rgb.2)/255))
                        .frame(width: 350, height: 50)
                        .padding(.bottom, 10)
                    Text("Shade Gradient")
                    HStack{
                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color(red: Double(rgb.0)/255.0, green: Double(rgb.1)/255.0, blue: Double(rgb.2)/255.0))
                            .frame(width: 50, height: 50)
                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color(red: Double(rgb.0) * 0.9 / 255.0, green: Double(rgb.1) * 0.9 / 255.0, blue: Double(rgb.2) * 0.9 / 255.0))
                            .frame(width: 50, height: 50)
                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color(red: Double(rgb.0) * 0.7 / 255.0, green: Double(rgb.1) * 0.7 / 255.0, blue: Double(rgb.2) * 0.7 / 255.0))
                            .frame(width: 50, height: 50)
                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color(red: Double(rgb.0) * 0.5 / 255.0, green: Double(rgb.1) * 0.5 / 255.0, blue: Double(rgb.2) * 0.5 / 255.0))
                            .frame(width: 50, height: 50)
                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color(red: Double(rgb.0) * 0.3 / 255.0, green: Double(rgb.1) * 0.3 / 255.0, blue: Double(rgb.2) * 0.3 / 255.0))
                            .frame(width: 50, height: 50)
                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color(red: Double(rgb.0) * 0.1 / 255.0, green: Double(rgb.1) * 0.1 / 255.0, blue: Double(rgb.2) * 0.1 / 255.0))
                            .frame(width: 50, height: 50)
                    }
                    .padding(.bottom, 10)
                    Text("Tint Gradient")
                    HStack{
                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color(red: Double(rgb.0)/255.0, green: Double(rgb.1)/255.0, blue: Double(rgb.2)/255.0))
                            .frame(width: 50, height: 50)
                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color(red: Double(rgb.0 + Int(Double((255 - rgb.0)) * 0.1)) / 255.0,
                                        green: Double(rgb.1 + Int(Double((255 - rgb.1)) * 0.1)) / 255.0,
                                        blue: Double(rgb.2 + Int(Double((255 - rgb.2)) * 0.1)) / 255.0))
                            .frame(width: 50, height: 50)
                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color(red: Double(rgb.0 + Int(Double((255 - rgb.0)) * 0.3)) / 255.0,
                                        green: Double(rgb.1 + Int(Double((255 - rgb.1)) * 0.3)) / 255.0,
                                        blue: Double(rgb.2 + Int(Double((255 - rgb.2)) * 0.3)) / 255.0))
                            .frame(width: 50, height: 50)
                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color(red: Double(rgb.0 + Int(Double((255 - rgb.0)) * 0.5)) / 255.0,
                                        green: Double(rgb.1 + Int(Double((255 - rgb.1)) * 0.5)) / 255.0,
                                        blue: Double(rgb.2 + Int(Double((255 - rgb.2)) * 0.5)) / 255.0))
                            .frame(width: 50, height: 50)
                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color(red: Double(rgb.0 + Int(Double((255 - rgb.0)) * 0.7)) / 255.0,
                                        green: Double(rgb.1 + Int(Double((255 - rgb.1)) * 0.7)) / 255.0,
                                        blue: Double(rgb.2 + Int(Double((255 - rgb.2)) * 0.7)) / 255.0))
                            .frame(width: 50, height: 50)
                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color(red: Double(rgb.0 + Int(Double((255 - rgb.0)) * 0.9)) / 255.0,
                                        green: Double(rgb.1 + Int(Double((255 - rgb.1)) * 0.9)) / 255.0,
                                        blue: Double(rgb.2 + Int(Double((255 - rgb.2)) * 0.9)) / 255.0))
                            .frame(width: 50, height: 50)
                    }

                }
                
                Button("Add to My Colors") {
                    collection.add(item: item)
                }
                .buttonStyle(.borderedProminent)
                .tint(.black)
                .padding(.top, 20)
                
                Spacer()
            }
            .frame(width: 300)
            
            
        }
        

    }
}

#Preview {
    AllColorsDetail(item: JColorName.example)
        .environmentObject(Collection())
}

// convert hex to UIColor
func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return UIColor.gray
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

// convert hex to rgb
func hexToRGB(hex: String) -> (Int, Int, Int)? {
    var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
    hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

    var rgb: UInt64 = 0

    Scanner(string: hexSanitized).scanHexInt64(&rgb)

    let red = Int((rgb & 0xFF0000) >> 16)
    let green = Int((rgb & 0x00FF00) >> 8)
    let blue = Int(rgb & 0x0000FF)

    return (red, green, blue)
}
