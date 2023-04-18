import SwiftUI

//Global array for defining notes
let notesArray: [String] = ["C2","D2","E2","F2","G2","A2","B2", "C3","D3","E3","F3","G3","A3","B3", "C4"]
let bNotesArray: [String] = ["Db2","Eb2","Gb2","Gb2","Ab2","Bb2","Db3","Db3","Eb3","Fb3","Gb3","Ab3","Bb3", "Bb3", "Bb3"
]

class Note: ObservableObject {
    @Published var note: String
    var isFlat: Bool
    var reseting: Double
    var positionY: CGFloat
    var positionX: CGFloat
    var speed: CGFloat
    init(notep: String) {
        self.note = notep
        self.positionX = 0
        self.isFlat = false
        self.positionY = 0
        self.speed = 2
        self.reseting = 1
    }
    func collision(){
        self.reseting = 0
        self.positionX = 0
    }
    func changeNote(y: CGFloat) {
        generateRandomNote(y:y)
    }
    func missNote() {
        self.positionX -= UIScreen.main.bounds.width/20
    }
    func generateRandomNote(y: CGFloat){
        let randomIndex: Int = Int.random(in: 0...14)
        if (Int.random(in: 0...1) > 0){
            self.isFlat = true
        }
        else {
            self.isFlat = false
        }
        self.note = notesArray[randomIndex]
        self.positionY = CGFloat((randomIndex)) * y/42 + CGFloat((randomIndex)) * y/800
        
    }
}

struct NoteView: View {
    @EnvironmentObject var curNote: Note
    var body: some View {
            Ellipse()
                .stroke(lineWidth: 3.0)
                .foregroundColor(.black)

    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView()
    }
}
