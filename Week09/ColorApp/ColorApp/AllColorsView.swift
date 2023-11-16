//
//  AllColorsView.swift
//  ColorApp
//
//

import SwiftUI

struct AllColorsView: View {
    private var colorName: [JColorName] = JColorName.allColorNames

    var body: some View {
        NavigationStack{
            List{
                ForEach(colorName, id: \.name){ color in
                    NavigationLink(value: colorName){
                        AllColorsItem(item: color)
                    }
                }
                .listRowSeparator(.hidden)
                .listRowInsets(.init(top: 0, leading: 30, bottom: 0, trailing: 30))
            }
            .navigationDestination(for: JColorName.self){ item in
                AllColorsDetail(item: item)

            }
            .navigationTitle("All Colors")


        }
    }
}

#Preview {
    AllColorsView()
}
