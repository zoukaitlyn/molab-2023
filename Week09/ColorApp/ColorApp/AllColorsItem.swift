//
//  AllColorsItem.swift
//  ColorApp
//
//
// hex extension: https://www.reddit.com/r/SwiftUI/comments/x0pz68/use_hex_values_in_swiftui/

import SwiftUI

struct AllColorsItem: View {
    let item: JColorName

    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(hex: item.hex))
                .frame(width: 400, height: 120)
            HStack{
                VStack(alignment: .leading){
                    Text(item.name)
                        .font(.headline)
                        .foregroundStyle(.white)
                    Text(item.hex)
                        .foregroundStyle(.white)
                }
                .padding(.leading, 40)
                Spacer()
            }
        }
    }
}

#Preview {
    AllColorsItem(item: JColorName.example)
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in:CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
        (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .displayP3,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
