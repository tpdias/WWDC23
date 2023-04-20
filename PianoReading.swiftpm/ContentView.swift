import SwiftUI
import AVFAudio
import AVFoundation

struct ContentView: View {
    //player information
    @StateObject var curPlayer: Player = Player(hp: 3, points: 0)
    //onboarding variable
    @State var presentOnboarding: Bool = true
    //note information
    var curNote: Note = Note(notep: "C2")
    var body: some View {
        GeometryReader{ geometry in
            NavigationStack{
                ZStack(alignment: .center) {
                    Image("Background")
                        .resizable()
                        .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                        .opacity(0.7)
                    if(curPlayer.start == false){
                        MenuView(presentOnboarding: $presentOnboarding)
                            .environmentObject(curPlayer)
                    }
                    else{
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
            .fullScreenCover(isPresented: $presentOnboarding){
                OnboardingView(present: $presentOnboarding)
            }
        }
    }
}
