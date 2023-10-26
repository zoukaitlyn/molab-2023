//
//  Color.swift
//  Week06Data
//
// used https://app.quicktype.io/?l=swift to generate model

import Foundation

struct Colors: Codable {
    let colors: [Color]
}

struct Color: Codable, Hashable {
    let name, category, type: String
    let r, g, b, a: Int
    let rgba: [Int]
    let hex: String
    
    static let allColors: [Color] = Bundle.main.decode(file: "colors.json")
    static let sampleColor: Color = allColors[0]
    
    #if DEBUG
    static let example = Color(name: "red", category: "hue", type: "primary", r: 255, g: 0, b: 0, a:1, rgba: [255,0,0,1], hex: "#FF0")
    #endif
}

struct Code: Codable {
    let rgba: [Int]
    let hex: String
}

extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}






