//
//  RandomColor.swift
//  ColorApp
//
//

import SwiftUI

struct RandomColor: View {
    let randomDoubleR = Double.random(in: 0...255)
    let randomDoubleG = Double.random(in: 0...255)
    let randomDoubleB = Double.random(in: 0...255)

    var body: some View {
        VStack{
            Rectangle()
                .fill(Color(red: Double(randomDoubleR/255), green: Double(randomDoubleG/255), blue: Double(randomDoubleB/255)))
                .frame(width: 300, height: 300)
            Text("rgb(\(Int(randomDoubleR)), \(Int(randomDoubleG)), \(Int(randomDoubleB)))")
        }
        
    }
}

#Preview {
    RandomColor()
}
