//
//  FilterView.swift
//  Week06Data
//
//  
//

import SwiftUI

struct FilterView: View {
//    private var color: [Color] = Color.allColors
//    @Binding var selectedColor: Color
    let item: Color


    var body: some View {
        VStack{
            ScrollView(.horizontal){
                HStack{
//                    ForEach(color, id: \.name){ color in
                        VStack{
                            if(item.name == "reed"){
                                Text(item.name)
                                Circle()
                                    .strokeBorder(.black, lineWidth: 2)
    //                                .background(Circle().fill(color))
                                    .background(Circle().fill(.red))

                                    .frame(width: 45, height: 45)
    //                                .onTapGesture{
    //                                    selectedColor = color
    //                                }
    //                        }
                                Image("maltese")
                                    .colorMultiply(.red)
                            } else if(item.name == "red"){
                                Image("maltese")
                                    .colorMultiply(.blue)
                                Text(item.name)
                                Circle()
                                    .strokeBorder(.black, lineWidth: 2)
                                    .background(Circle().fill(.blue))
                                    .frame(width: 45, height: 45)
   
                            }
                            
                        

                    }
                }
                .padding()
                .background(.thinMaterial)
                .cornerRadius(20)
                .padding(.horizontal)
            }
            
            
            
        }
        
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(item: Color.example)
    }
}
