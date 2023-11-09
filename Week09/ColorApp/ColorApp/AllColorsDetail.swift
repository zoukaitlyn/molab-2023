//
//  AllColorsDetail.swift
//  ColorApp
//
// https://stackoverflow.com/questions/24263007/how-to-use-hex-color-values

import SwiftUI

struct AllColorsDetail: View {
    let item: JColorName
    var color1 = hexStringToUIColor(hex: "#d3d3d3")


    var body: some View {
        VStack(alignment: .leading){
            Rectangle()
                .fill(Color(hex: item.hex))
//                .fill(Color(color1))
                .frame(width: 350, height: 250)
            Text(item.name)
                .font(.title)
            Text("Complement")
            Text("Monochromatic")


            
            Spacer()
        }
        .padding(20)
        
    }
}

#Preview {
    AllColorsDetail(item: JColorName.example)
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
