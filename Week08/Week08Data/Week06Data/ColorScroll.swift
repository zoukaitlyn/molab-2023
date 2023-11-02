//
//  ColorScroll.swift
//  Week06Data
//
//  Created by Kaitlyn Zou on 11/2/23.
//

import SwiftUI

struct ColorScroll: View {
    @Binding var selectedColor: Color
    private let colors:[Color] = [.red, .yellow, .orange, .purple, .blue, .indigo, .green, .mint, .black, .white]


    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ColorScroll_Previews: PreviewProvider {
    static var previews: some View {
        ColorScroll(selectedColor: .constant(.blue))
    }
}
