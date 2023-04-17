import SwiftUI
import AVFAudio
import AVFoundation

struct ContentView: View {
    var curPlayer: Player = Player(hp: 3, points: 0)
    var curNote: Note = Note(notep: "C2")
    var body: some View {
        GeometryReader{ geometry in
            ZStack(alignment: .center) {
                Image("Background")
                    .resizable()
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                    .opacity(0.7)
                PlayerView()
                    .environmentObject(curPlayer)
                    .environmentObject(curNote)
                SheetView()
                    .environmentObject(curPlayer)
                    .environmentObject(curNote)
                PianoKeysView()
                    .environmentObject(curPlayer)
                    .environmentObject(curNote)
                
                
                
            }
        }
    }
}
