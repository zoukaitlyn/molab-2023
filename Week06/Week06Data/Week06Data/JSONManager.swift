//
//  Color.swift
//  Week06Data
//
// used https://app.quicktype.io/?l=swift to generate model

import Foundation

struct Colors: Codable {
    let colors: [Color]
}

struct Color: Codable {
    let name, category: String
    let type: String?
    let code: Code
    
    static let allColors: [Color] = Bundle.main.decode(file: "colors.json")
    static let sampleColor: Color = allColors[0]
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






