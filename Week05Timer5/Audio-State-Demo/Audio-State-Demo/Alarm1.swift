//
//  Alarm1.swift
//  Audio-State-Demo
//
//  Created by Kaitlyn Zou on 10/11/23.
//

import AVFoundation
import SwiftUI

let bundleAudio1 = [
    "rooster.wav",
    "bbc-birds-2.m4a",
    "scale-1.m4a"
];

func loadBundleAudio1(_ fileName:String) -> AVAudioPlayer? {
    let path = Bundle.main.path(forResource: fileName, ofType:nil)!
    let url = URL(fileURLWithPath: path)
    do {
        return try AVAudioPlayer(contentsOf: url)
    } catch {
        print("loadBundleAudio1 error", error)
    }
    return nil
}

struct Alarm1: View {
    @State var timeRemaining = 15
    
    // Flag for timer state.
    @State var timerIsRunning = false
    
    @State var timeToPlayAlarm = false
    
    // Timer gets called every second.
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var soundIndex = 0
    @State private var soundFile = bundleAudio1[0]
    @State private var player: AVAudioPlayer? = nil
    
    
    var body: some View {
        TimelineView(.animation) { context in
            VStack {

                // TimeDisplay view with data bindings.
                // NOTE: Syntax used for data bindings.
                TimeDisplay1(timeRemaining: $timeRemaining)
                
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
                        .frame(width: 160, height: 60)
                        .background(Color.black)
                        .foregroundColor(Color.white)
                        .cornerRadius(30)
                        .font(Font.custom("Chivo", size: 30))
                }
                Button("Stop") {
                    print("Button Stop")
                    player?.stop()
                }
                .font(Font.custom("Chivo", size: 24))
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
                player = loadBundleAudio1(soundFile)
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

struct TimeDisplay1: View {
    // Binding variable.
    @Binding var timeRemaining: Int
    
    var body: some View {
        VStack {
            Text("\(timeRemaining)")
                .font(Font.custom("Chivo", size: 120))
                .foregroundColor(.black)
                .onTapGesture {
                    // On tap gesture, increment timer by 10.
                    self.timeRemaining += 10
                }
            Text("Tap on time to increase")
                .foregroundColor(.black)
                .padding()
                .font(Font.custom("Chivo", size: 24))
            
        }
    }
}

struct Alarm1_Previews: PreviewProvider {
    static var previews: some View {
        Alarm1()
    }
}
