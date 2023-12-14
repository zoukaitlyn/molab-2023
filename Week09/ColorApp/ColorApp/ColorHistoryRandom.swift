//
//  ColorHistoryRandom.swift
//  ColorApp
//
// https://stackoverflow.com/questions/24003191/pick-a-random-element-from-an-array
// chatgpt

import SwiftUI

struct ColorHistoryRandom: View {
    let colorHistory: ColorHistory = [
        ColorHistoryFact(name: "Red", hex: "FF0000", fact: "Cochineal is a pigment of red that’s derived from a scale insect of the same name. It took around 70,000 of these bugs to get one pound of raw cochineal dye. This pigment is actually still used today in food and cosmetics under the label E120."),
        ColorHistoryFact(name: "Purple", hex: "660066", fact: "Tyrian purple was originally derived from two varieties of shellfish found in the Mediterranean, produced by a pale gland in its body. It took 250,000 shellfish to produce one ounce of dye, and these shellfish were hunted to the point of near extinction."),
        ColorHistoryFact(name: "Green", hex: "00CC00", fact: "This green pigment was derived from a compound copper arsenite which is incredibly toxic — and  that a piece of Scheele’s green wallpaper that was only a few inches long had enough arsenic to kill two adults. It’s been rumored that Scheele’s green’s most famous victim could have been Napoleon."),
        ColorHistoryFact(name: "Blue", hex: "0000FF", fact: "In modern culture, we tend to think of blue as associated with boys and pink associated with girls, but if you go back a century and a half, it was quite the opposite. Blue was viewed as a feminine color because of its association with the Virgin Mary while pink was seen as a lighter shade of red, and viewed as a more masculine color."),
        ColorHistoryFact(name: "Black", hex: "000000", fact: "Vantablack is an acronym for vertically aligned carbon nanotube arrays, and technically it is not really a color at all. Instead, it’s a substance that absorbs more light than anything else in the world.")
            ]

//    store the currently displayed random color fact.
    @State private var randomColorFact: ColorHistoryFact?

    var body: some View {
        VStack(alignment: .leading) {
            if let colorFact = randomColorFact {
                ZStack{
                    RoundedRectangle(cornerRadius: 9)
                        .fill(Color(hex: colorFact.hex))
                        .frame(width: 350, height: 300)
                    
                    VStack(alignment: .leading) {
                        Spacer()
                        Text(colorFact.fact)
//                            .font(.subheadline)
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                        ZStack{
                            Text(colorFact.name)
                                .font(.headline)
                                .padding(10)
                                .foregroundStyle(.white)
                                .background(Color.black.opacity(0.2))
                                .cornerRadius(9)
                        }
                        
                    }
                    .frame(width: 320, height: 300)
                    .padding(.bottom, 30)
                }
                
            } else {
                Text("Learn a fun color fact!")
//                    .font(.headline)
//                    .padding(10)
//                    .foregroundStyle(.white)
//                    .background(.pink)
//                    .cornerRadius(9)
            }

            Text("From Kassia St. Clair's Secret Lives of Color")
            Button("Generate") {
                randomColorFact = colorHistory.randomElement()
            }
            .foregroundStyle(.white)
            .padding(10)
            .background(.black)
            .cornerRadius(9)
            
            
        }
//        .navigationTitle("Random Color Fact")
        .padding()
    }
}

#Preview {
    ColorHistoryRandom()
}
