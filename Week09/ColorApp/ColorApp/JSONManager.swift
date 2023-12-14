//
//  JSONManager.swift
//  ColorApp
//
//  Created by Kaitlyn Zou on 11/7/23.

// https://github.com/jonathantneal/color-names/blob/master/color-names.json
// https://json-color-palette-generator.vercel.app/
//
// used https://app.quicktype.io/?l=swift to generate model


import Foundation

struct ColorList: Codable {
    let colorList: [JColor]
}

struct JColor: Codable, Hashable {
    let name, category, type: String
    let r, g, b, a: Int
    let rgba: [Int]
    let hex: String
    
    static let allColors: [JColor] = Bundle.main.decode(file: "colors.json")
    static let sampleColor: JColor = allColors[0]
    
    #if DEBUG
    static let example = JColor(name: "Red", category: "Hue", type: "Primary", r: 255, g: 0, b: 0, a:1, rgba: [255,0,0,1], hex: "#FF0")
    #endif
}


struct Code: Codable {
    let rgba: [Int]
    let hex: String
}

struct JColorName: Codable, Hashable {
    let hex, name: String
    
    static let allColorNames: [JColorName] = Bundle.main.decode(file: "color-names.json")    
    static let sampleColorName: JColorName = allColorNames[0]

    
    #if DEBUG
    static let example = JColorName(hex: "#4c4f56", name: "Abbey")
    #endif

}

typealias JColorNames = [JColorName]

struct ColorHistoryFact: Codable {
    let name, hex, fact: String
    
    #if DEBUG
    static let example = ColorHistoryFact(name: "Red", hex: "FF0000", fact: "Cochineal is a pigment of red that’s derived from a scale insect of the same name. It took around 70,000 of these bugs to get one pound of raw cochineal dye. This pigment is actually still used today in food and cosmetics under the label E120.")
    #endif
}

typealias ColorHistory = [ColorHistoryFact]

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
