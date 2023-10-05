// Count down timer
// @Binding

import SwiftUI
import AVFoundation

let urlSounds = [
    "https://www.youraccompanist.com/images/stories/Reference%20Scales_On%20A%20Flat-G%20Sharp.mp3"
]

func loadUrlAudio(_ urlString:String) -> AVAudioPlayer? {
    let url = URL(string: urlString)
    do {
        let data = try Data(contentsOf: url!)
        return try AVAudioPlayer(data: data)
    } catch {
        print("loadUrlSound error", error)
    }
    return nil
}

struct Alarm1: View {
    // Time remaining in seconds. The source of truth.
    @State var timeRemaining = 5
    
    // Flag for timer state.
    @State var timerIsRunning = false
    
    @State var timeToPlayAlarm = false
    
    // Timer gets called every second.
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var soundIndex = 0
    @State private var soundFile = urlSounds[0]
    @State private var player: AVAudioPlayer? = nil

    var body: some View {
        TimelineView(.animation) { context in
            VStack {
                // TimeDisplay view with data bindings.
                // NOTE: Syntax used for data bindings.
                TimeDisplay(timeRemaining: $timeRemaining)
                
                Button(action: {
                    // Toggle timer on/off.
                    self.timerIsRunning.toggle()
                    
                    // If timer is not running, reset back to 5
                    if !self.timerIsRunning {
                        self.timeRemaining = 5
                        
                    }
                }) {
                    // Start / Stop Button
                    Text(timerIsRunning ? "Reset" : "Start")
                        .font(.system(size: 30))
                        .frame(width: 160, height: 60)
                        .background(Color.black)
                        .foregroundColor(Color.white)
                        .cornerRadius(30)
                }
                Button("Stop") {
                    print("Button Stop")
                    player?.stop()
                }
            }
        }
        .onReceive(timer) { _ in
            // Block gets called when timer updates.
            
            // If timeRemaining and timer is running, count down.
            if self.timeRemaining > 0 && self.timerIsRunning {
                self.timeRemaining -= 1
                print("Time Remaining:", self.timeRemaining)
                self.timeToPlayAlarm = false
                
            }
            
            if self.timeRemaining == 0 && !self.timeToPlayAlarm  {
                self.timeToPlayAlarm = true
                print("finished, play audio")
                print(self.timeRemaining)
                player = loadUrlAudio(soundFile)
                // Loop indefinitely
                player?.numberOfLoops = -1
                player?.play()
                
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.yellow)
        .edgesIgnoringSafeArea(.all)
    }
}

struct TimeDisplay: View {
    // Binding variable.
    @Binding var timeRemaining: Int
    
    var body: some View {
        VStack {
            Text("\(timeRemaining)")
                .font(.system(size: 120))
                .foregroundColor(.black)
                .onTapGesture {
                    // On tap gesture, increment timer by 10.
                    self.timeRemaining += 10
                }
            Text("Tap on time to increase")
                .foregroundColor(.black)
                .padding()
        }
    }
}

struct Pag11_Previews: PreviewProvider {
    static var previews: some View {
        Alarm1()
    }
}

// Source
// https://github.com/mobilelabclass/mobile-lab-timer-kit

