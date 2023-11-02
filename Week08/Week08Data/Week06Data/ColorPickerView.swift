//
//  ColorPickerView.swift
//  Week06Data
//
//  tutorial: https://youtu.be/Kp9sHwp4wN8?si=1f8gAGDnLWc96jvp
//  error: type Color has no member...
//
//import SwiftUI
//
//
//struct ColorPickerView: View {
//
//    @State private var selectedColor: Color = .red
////    @State private var selectedColor: Color = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
//
//
//    var body: some View {
//        VStack{
//            Circle()
//                .foregroundColor(selectedColor)
//                .frame(width: 200, height: 200)
//                .padding()
//            ColorPicker("Change circle color", selection: $selectedColor)
//        }
//
//    }
//}
//
//struct ColorPickerView_Previews: PreviewProvider {
//    static var previews: some View {
//        ColorPickerView()
//    }
//}
