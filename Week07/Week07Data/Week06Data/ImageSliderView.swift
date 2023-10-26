//
//  ImageSliderView.swift
//  Week06Data
//
//  Created by Kaitlyn Zou on 10/25/23.
//

import SwiftUI

struct ImageSliderView: View {
    private let images = ["redpalette1", "redpalette2", "redpalette3", "redpalette4"]
    
    var body: some View {
        TabView {
            ForEach(images, id: \.self) { item in
                Image(item)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct ImageSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSliderView()
            .previewLayout(.fixed(width: 200, height: 200))
    }
}
