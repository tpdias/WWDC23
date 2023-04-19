import SwiftUI

class Player: ObservableObject {
    @Published var hp: Int = 3
    @Published var points: Int = 0
    @Published var start: Bool = false
    @Published var tutorial: Bool = false
    
    init(hp: Int, points: Int) {
        self.hp = hp
        self.points = points
    }
    func addPoints() {
        self.points += 5
    }
    func missNote() {
        self.hp -= 1
        self.checkGameOver()
    }
    func checkGameOver(){
        if(self.hp < 1){
            self.start = false
        }
    }
    func getHp() -> Int {
        return self.hp
    }
    func startGame(){
        self.start = true
        self.hp = 3
        self.tutorial = false
        self.points = 0
    }
    func startTutorial(){
        self.start = true
        self.tutorial = true
        self.points = 0
        self.hp = 3
    }
    func endGame(){
        self.tutorial = false
        self.start = false
        self.points = 0
        self.hp = 3
    }
}


struct PlayerView: View {
    @EnvironmentObject var curPlayer: Player
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Rectangle()
                    .frame(width: 110, height: 50, alignment: .center)
                    .foregroundColor(.blue)
                    .border(Color.black, width: 1)
                    .cornerRadius(10.0, antialiased: true)
                Text("Life Points: " + String(curPlayer.hp))
                    .foregroundColor(.white)
                
            }
            .position(x: geometry.frame(in: .global).maxX/1.1, y: geometry.frame(in: .global).maxY/35)
            
            Button(action: {curPlayer.endGame()}, label: {
                ZStack{
                    Rectangle()
                        .frame(width: 130, height: 50, alignment: .center)
                        .foregroundColor(.blue)
                        .border(Color.black, width: 1)
                        .cornerRadius(10.0, antialiased: true)
                    
                    Text("Back to Menu")
                     .foregroundColor(.white)                
                    
                }
            })
            .position(x: geometry.frame(in: .global).maxX/2, y: geometry.frame(in: .global).maxY/35)
            ZStack{
                Rectangle()
                    .frame(width: 110, height: 50, alignment: .center)
                    .foregroundColor(.blue)
                    .border(Color.black, width: 1)
                    .cornerRadius(10.0, antialiased: true)
                
                Text("Points: " + String(curPlayer.points))
            }
            .position(x: geometry.frame(in: .global).maxX/15, y: geometry.frame(in: .global).maxY/35)
        }
        
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
