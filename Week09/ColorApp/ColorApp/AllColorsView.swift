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
                    NavigationLink(value: color){
                        AllColorsItem(item: color)
                    }
                }
                .listRowSeparator(.hidden)
                //                .scrollContentBackground(.hidden)
                .listRowInsets(.init(top: 10, leading: 30, bottom: 0, trailing: 30))
            }
            .navigationTitle("All Colors")
            .navigationDestination(for: JColorName.self){ item in
                AllColorsDetail(item: item)
                
            }
        }
    }
    
}

#Preview {
    AllColorsView()
}
