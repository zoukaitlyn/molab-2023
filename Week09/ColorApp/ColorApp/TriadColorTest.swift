//
//  TriadColorTest.swift
//  ColorApp
//
//  Created by Kaitlyn Zou on 11/29/23.
//

import SwiftUI

struct TriadColorTest: View {
    let originalColor = Color(red: 1.0, green: 0.0, blue: 0.0)
        let (triad1, triad2, _) = Color.triadicColorsForRGB(forRGB: (255, 0, 0))

        var body: some View {
            VStack {
                originalColor.frame(width: 100, height: 100)
                    .overlay(Text("Original").foregroundColor(.white))

                triad1.frame(width: 100, height: 100)
                    .overlay(Text("Triad 1").foregroundColor(.white))

                triad2.frame(width: 100, height: 100)
                    .overlay(Text("Triad 2").foregroundColor(.white))
            }
            .background(Color.black)
            .padding()
        }
}

#Preview {
    TriadColorTest()
}

extension Color {
    // Function to calculate triadic colors based on RGB values
    static func triadicColorsForRGB(forRGB rgb: (Double, Double, Double)) -> (Color, Color, Color) {
        let (r, g, b) = rgb
        
        // Convert RGB to HSL
        let h = Double(atan2(3.0 * (2.0 * r - g - b), sqrt(3.0 * (r - g) * (r - g) + (r - b) * (g - b)))) * (180 / .pi)
        let hue = h >= 0 ? h : h + 360.0
        let saturation = 1.0 - (3.0 * min(r, g, b) / (r + g + b))
        let lightness = (r + g + b) / (3.0 * 255.0)
        
        // Calculate triadic colors in HSL
        let triad1 = Color.hslToColor(h: hue + 120.0, s: saturation, l: lightness)
        let triad2 = Color.hslToColor(h: hue + 240.0, s: saturation, l: lightness)
        
        return (Color(red: r / 255, green: g / 255, blue: b / 255), triad1, triad2)
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
