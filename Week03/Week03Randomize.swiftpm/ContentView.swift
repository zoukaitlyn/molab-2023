import SwiftUI

var images = ["rectangle",
              "triangle",
              "hexagon",
              "pentagon",
              "rhombus",
              "diamond",
              "circle",
              "seal",
              "oval",
              "capsule"]

struct ContentView: View {

// allows us to modify values inside a struct
@State var random: String = ""
@State var imagePosition = CGPoint(x: 100, y: 100)
@State var imageSize = CGSize(width: 100, height: 100)
let screenSize = UIScreen.main.bounds.size

var body: some View {
    VStack {
        Image(systemName: random)
            .resizable()
            .frame(width: imageSize.width, height: imageSize.height)
            .position(imagePosition)
            .foregroundColor(Color(red: Double.random(in: 0...255) / 255, green: Double.random(in: 0...255) / 255, blue: Double.random(in: 0...255) / 255))

        Button(action: {
            self.random = chooseRandomImage()
            self.randomizeImagePosition()
            self.randomizeImageSize()

        }) {
            Text("Randomize!")
        }
            .font(.title3)
            .padding()
            .background(Color.pink)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
    .background(Color(red: Double.random(in: 0...255) / 255, green: Double.random(in: 0...255) / 255, blue: Double.random(in: 100...200) / 255)
)

}
    func randomizeImagePosition() {
        let randomX = CGFloat.random(in: 0...(screenSize.width - 100)) // Adjust 100 for image width
        let randomY = CGFloat.random(in: 0...(screenSize.height - 100)) // Adjust 100 for image height
        self.imagePosition = CGPoint(x: randomX, y: randomY)
    }
    
    func randomizeImageSize(){
        let randomSize = CGFloat.random(in: 100...300)
        self.imageSize = CGSize(width: randomSize, height: randomSize)
    }
}

func chooseRandomImage() -> String {
    let array = images
    // an optional is a var or constant that can hold a value or no value
    // ! means an optional is being unwrapped
    let result = array.randomElement()!
    return result
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

