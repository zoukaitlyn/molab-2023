//
//  ContentView.swift


import SwiftUI

struct ContentView: View {
    @State private var input = ""
    @AppStorage("name") var username = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome \(username)")

                TextField("Input name", text: $input)
                    .font(Font.custom("Chivo", size: 15))
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))

                
                HStack {
                    Button("Log in") {
                        username = input
                        
                    }
                    .font(Font.custom("Chivo", size: 10))
                    Button("Log out") {
                        username = "Anonymous"
                    }
                    .font(Font.custom("Chivo", size: 10))

                }
                
                List{
                    NavigationLink (destination: Alarm1()) {
                        Text("15 Second Timer")
                        .font(Font.custom("Chivo", size: 24))
                    }
                    NavigationLink (destination: Alarm1(timeRemaining: 30)) {
                        Text("30 Second Timer")
                        .font(Font.custom("Chivo", size: 24))
                    }
                }
            }
            .font(Font.custom("Chivo", size: 30))

        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



