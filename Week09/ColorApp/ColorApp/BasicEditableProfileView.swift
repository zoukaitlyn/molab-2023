//
//  BasicEditableProfileView.swift
//  ColorApp
//
// source: https://gist.github.com/HugoSay/85ad6255c29de81fc56c2a413125fa47


import SwiftUI
import MapKit

struct Profile {
    var firstName: String
    var title: String
    var city: String
}

struct BasicEditableProfileView: View {
    @State var profile: Profile
    @State var mode: EditMode = .inactive
    @Namespace private var namespace


    var body: some View {
        NavigationView {
            Group {
                if mode.isEditing {
                    editFormView()
                } else {
                    VStack(alignment: .leading){
                        HStack{
                            Text(profile.firstName)
                                .bold()
                                .font(.largeTitle)
                            Spacer()
                        }
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(red: 19/255, green: 60/255, blue: 150/255))
                                .frame(width: 200, height: 30)
                            Text(profile.title)
                                .foregroundStyle(.white)
                        }
                        .padding(.leading, 5)

                        
                        
                        ZStack(alignment: .top){
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(red: 235/255, green: 238/255, blue: 242/255))
                                .frame(width: 350, height: 200)
                            
                            VStack(alignment: .leading){
                                HStack {
                                    Text("My Colors")
                                        .bold()
                                        .font(.system(size: 25))
                                    Spacer()
                                }
                                .padding(.leading, 20)
                                .padding(.top, 15)
                                
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(.red)
                                        .frame(width: 80, height: 80)
                                    
                                    VStack(alignment: .leading){
                                        Text("Red")
                                            .font(.headline)
                                            .foregroundStyle(.white)
                                        Text("#aa0000")
                                            .foregroundStyle(.white)
                                    }
                                }
                                .padding(.leading, 20)
                            }
                        }
                        
                        ZStack(alignment: .top){
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(red: 235/255, green: 238/255, blue: 242/255))
                                .frame(width: 350, height: 200)
                            HStack {
                                Text("My Color Palettes")
                                    .bold()
                                    .font(.system(size: 25))
                                Spacer()
                            }
                            .padding(.leading, 20)
                            .padding(.top, 15)
                        }
                        
                        
                        Spacer()
                    }
                    
//                    formView()
                }
            }
            .padding(.horizontal)
            .navigationTitle("Welcome,")
            .navigationBarItems(trailing: EditButton())
            .environment(\.editMode, self.$mode)
        }
    }

    fileprivate func formView() -> some View {
        return Form{
            Section(header: Text("My info")) {
                HStack {
                    Text("First name:")
                    Spacer()
                    Text(profile.firstName).foregroundColor(.secondary)
                }

                HStack {
                    Text("Last name:")
                    Spacer()
                    Text(profile.title).foregroundColor(.secondary)
                }

                HStack {
                    Text("City:")
                    Spacer()
                    Text(profile.city).foregroundColor(.secondary)
                }
            }
        }
    }

    fileprivate func editFormView() -> some View {
        return Form{
            Section(header: Text("First name")) {
                TextField("first name",text: $profile.firstName)
            }
            Section(header: Text("Title")) {
                TextField("Title",text: $profile.title)
            }
            Section(header: Text("City")) {
                TextField("City",text: $profile.city)
            }

        }
    }
}

#Preview {
    BasicEditableProfileView(profile: Profile(firstName: "Tim", title: "Graphic Designer", city: "Cupertino"))
}
