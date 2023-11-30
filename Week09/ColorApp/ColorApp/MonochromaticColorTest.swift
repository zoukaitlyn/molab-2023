//
//  MonochromaticColorTest.swift
//  ColorApp
//
//  Created by Kaitlyn Zou on 11/29/23.
//  source: chatgpt

import SwiftUI

struct MonochromaticColorTest: View {
    let baseColor = Color(red: 0.0, green: 0.5, blue: 1.0) // Example base color (blue)
    let shadeColorPalette = Color.shadeColorPalette(baseRGB: (0, 128, 255), count: 8) // Adjust baseRGB and count as needed

        var body: some View {
            HStack(spacing: 0) {
                ForEach(shadeColorPalette, id: \.self) { color in
                    color.frame(width: 50, height: 80)
                }
            }
            .padding()
        }
}

#Preview {
    MonochromaticColorTest()
}

extension Color {
    // Function to generate a color palette with shade variations
    static func shadeColorPalette(baseRGB: (Double, Double, Double), count: Int) -> [Color] {
        let (r, g, b) = baseRGB
        
        // Convert RGB to HSL
        let h = Double(atan2(3.0 * (2.0 * r - g - b), sqrt(3.0 * (r - g) * (r - g) + (r - b) * (g - b)))) * (180 / .pi)
        let hue = h >= 0 ? h : h + 360.0
        let saturation = 1.0 - (3.0 * min(r, g, b) / (r + g + b))
        
        var palette: [Color] = []
        
        // Generate shades
        for i in 0..<count {
            let lightness = Double(i) / Double(count - 1)
            let shadedColor = Color.hslToColor(h: hue, s: saturation, l: lightness)
            palette.append(shadedColor)
        }
        
        return palette
    }
    
    // Function to convert HSL to Color
    private static func hslToColor(h: Double, s: Double, l: Double) -> Color {
        let c = (1 - abs(2 * l - 1)) * s
        let x = c * (1 - abs((h / 60).truncatingRemainder(dividingBy: 2) - 1))
        let m = l - c / 2
        
        var rgb: (Double, Double, Double)
        
        switch h {
        case 0..<60:
            rgb = (c, x, 0)
        case 60..<120:
            rgb = (x, c, 0)
        case 120..<180:
            rgb = (0, c, x)
        case 180..<240:
            rgb = (0, x, c)
        case 240..<300:
            rgb = (x, 0, c)
        default:
            rgb = (c, 0, x)
        }
        
        return Color(red: (rgb.0 + m), green: (rgb.1 + m), blue: (rgb.2 + m))
    }
}

