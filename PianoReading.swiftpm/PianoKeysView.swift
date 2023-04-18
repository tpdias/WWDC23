import SwiftUI
import AVFAudio
import AVFoundation

//Keys
struct Key{
    var sound: SoundManager = SoundManager()
    var name: String
    func playSound() {
        sound.playNoteSound(self.name)
    }
}
let keys: [Key] = [Key(name: "C2"),Key(name:"D2"),Key(name: "E2"),Key(name:"F2"),Key(name: "G2"),Key(name: "A2"),Key(name: "B2"), Key(name: "C3"),Key(name:"D3"),Key(name: "E3"),Key(name:"F3"),Key(name: "G3"),Key(name: "A3"),Key(name: "B3"), Key(name: "C4")]
let bkeys: [Key] = [Key(name: "Db2"),Key(name:"Eb2"),Key(name: "Gb2"),Key(name:"Gb2"),Key(name: "Ab2"),Key(name: "Bb2"),Key(name: "Db3"), Key(name: "Db3"),Key(name:"Eb3"),Key(name: "Fb3"),Key(name:"Gb3"),Key(name: "Ab3"),Key(name: "Bb3"),Key(name: "Bb3"), Key(name: "Bb4")]

//Sound management
public class SoundManager{
    
     static var shared: SoundManager = SoundManager()
    
     var player: AVAudioPlayer?
     var playerBackground: AVAudioPlayer?
        
    func playNoteSound(_ name: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else { return  }
        do {
            playerBackground = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let playerBackground = playerBackground else { return  }
            playerBackground.volume = 1
            playerBackground.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}



struct PianoKeysView: View {
    
   
    @EnvironmentObject var curPlayer: Player
    @EnvironmentObject var curNote: Note
    var body: some View {
        GeometryReader { geometry in
            HStack(
                alignment: .top,
                spacing: 1
            ) {
                ForEach(
                    0...14,
                    id: \.self
                ) { index in 
                    
                    ZStack(alignment: .topTrailing) {
                        Button(action: {whiteKeyPress(index: index, y: (UIScreen.main.bounds.height))}, label: {
                            Rectangle()
                                .fill(.white)
                                .frame(width: UIScreen.main.bounds.width * 0.05, height: UIScreen.main.bounds.height * 0.3)
                        })
                        
                        if index == 2 || index == 6 || index == 9 || index == 13 || index == 14{
                            EmptyView()
                        } else {
                            Button(action: {blackKeyPress(index: index, y: (UIScreen.main.bounds.height))}, label: {
                                Rectangle()
                                    .fill(.black)
                                    .frame(width: UIScreen.main.bounds.width * 0.022, height: UIScreen.main.bounds.height * 0.15)
                            })
                        }
                    }
                    
                }
                
            }
            .position(x: UIScreen.main.bounds.width * 0.2, y: geometry.frame(in: .global).midY)
        }
        //.frame(width: UIScreen.main.bounds.width/5.55, height: UIScreen.main.bounds.height/2.35, alignment: .center)
        .frame(width: 500, height: 300, alignment: .center)
    }
    
    func whiteKeyPress(index: Int, y: CGFloat) {
        keys[index].playSound()
        if(notesArray[index] == curNote.note || bNotesArray[index] == curNote.note){
            curNote.collision()
            curNote.changeNote(y: y)
            curPlayer.addPoints()
        }
        else{
            curNote.missNote()
        }
    }
    func blackKeyPress(index: Int, y: CGFloat) {
        bkeys[index].playSound()
        if(notesArray[index] == curNote.note || bNotesArray[index] == curNote.note){
            curNote.collision()
            curNote.changeNote(y: y)
            curPlayer.addPoints()
        }
        else{
            curNote.missNote()
        }
    }
    
}


struct PianoKeys_Previews: PreviewProvider {
    static var previews: some View {
        PianoKeysView()
    }
}
