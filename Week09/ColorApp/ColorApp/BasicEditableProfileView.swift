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
    @EnvironmentObject var collection: Collection
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
                                .foregroundStyle(.black)
                                .bold()
                                .font(.largeTitle)
                            Spacer()
                        }
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(red: 178/255, green: 255/255, blue: 102/255))
                                .frame(width: 200, height: 30)
                            Text(profile.title)
                        }
                        .padding(.leading, 5)
                        
                        ZStack(alignment: .top){
                            VStack(alignment: .leading){
                                HStack {
                                    Text("My Colors")
                                        .bold()
                                        .font(.system(size: 25))
                                    Spacer()
                                }
                                .padding(.leading, 20)
                                .padding(.top, 15)
                                
                                VStack{
                                    List{
                                        ForEach(collection.items, id: \.self){ item in
                                            ZStack{
                                                RoundedRectangle(cornerRadius: 10)
                                                    .fill(Color(hex: item.hex))
                                                    .frame(width: 340, height: 80)
                                                HStack{
                                                    VStack(alignment: .leading){
                                                        Text(item.name)
                                                            .font(.headline)
                                                            .padding(10)
                                                            .foregroundStyle(.white)
                                                            .background(Color.black.opacity(0.2))
                                                            .cornerRadius(9)
                                                    }
                                                    .padding(.top, 30)
                                                    .padding(.leading, 10)
                                                    Spacer()
                                                    
                                                }
                                                
                                                
                                            }
                                        
                                        }
                                        .onDelete(perform: deleteItems)
                                    }
                                    .listStyle(PlainListStyle())
                                    .listRowSeparator(.hidden)
//                                    .toolbar {
//                                        EditButton()
//                                    }

                                }
//                                .padding(.leading, 20)
                            }
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
        .background(Color.clear)
    }
    
    func deleteItems(at offsets: IndexSet) {
        collection.items.remove(atOffsets: offsets)
    }
}

#Preview {
    BasicEditableProfileView(profile: Profile(firstName: "Tim", title: "Graphic Designer", city: "Cupertino"))
        .environmentObject(Collection())
}

