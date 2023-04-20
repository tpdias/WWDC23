import SwiftUI

//Global array for defining notes
let notesArray: [String] = ["C2","D2","E2","F2","G2","A2","B2", "C3","D3","E3","F3","G3","A3","B3", "C4"]
let bNotesArray: [String] = ["Db2","Eb2","","Gb2","Ab2","Bb2","","Db3","Eb3","","Gb3","Ab3", "Bb3", ""]

//Class for the note
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
        self.speed = 1
        self.reseting = 1
    }
    //collision with the left side of the score
    func collision(){
        self.reseting = 0
        self.positionX = 0
    }
    //generates a random note and calculates the speed of the note
    func changeNote(y: CGFloat, curPlayer: Player) {
        generateRandomNote(y:y)
        //only has a speed if out of tutorial
        if(!curPlayer.tutorial){
            self.speed = 1 + CGFloat(0.0005 * Float(curPlayer.points))
        }
        else{
            self.speed = 1
        }
    }
    //jump to the left if miss a note
    func missNote() {
        self.positionX -= UIScreen.main.bounds.width/20
    }
    //generate a note, can be flat or not
    func generateRandomNote(y: CGFloat){
        var randomIndex: Int = Int.random(in: 0...14)
        //if flat, avoid the empty spaces in the switch
        if (Int.random(in: 0...1) > 0){
            self.isFlat = true
            switch(randomIndex){
            case 2:
                randomIndex = 3
            case 6:
                randomIndex = 5
            case 9:
                randomIndex = 10
            case 13:
                randomIndex = 12
            case 14:
                randomIndex = 11
            default:
                randomIndex += 0
            }
            
        }
        else {
            self.isFlat = false
        }
        if(self.isFlat){
            self.note = bNotesArray[randomIndex]
        }
        else{
            self.note = notesArray[randomIndex]
        }
        //calculating position on the score
        if(self.isFlat == true){
            self.positionY = CGFloat((randomIndex + 1)) * y/42 + CGFloat((randomIndex + 1)) * y/800
        }
        else{
            self.positionY = CGFloat((randomIndex)) * y/42 + CGFloat((randomIndex)) * y/800
        }
        
    }
}

struct NoteView: View {
    @EnvironmentObject var curNote: Note
    @EnvironmentObject var curPlayer: Player
    var body: some View {
        //elipse with or without text or flat signal
        ZStack{
            if(curNote.isFlat){
                Text("♭")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .position(x: -15, y: 17)
            }
            Ellipse()
                .stroke(lineWidth: 3.0)
                .foregroundColor(.black)
            if(curPlayer.tutorial == true){
                Text(curNote.note.dropLast(1))
                    .foregroundColor(.black)
            }
            
        }
    }
}
