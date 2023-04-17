import SwiftUI

class Player: ObservableObject {
    @Published var hp: Int = 3
    @Published var points: Int = 0
    init(hp: Int, points: Int) {
        self.hp = hp
        self.points = points
    }
     func addPoints() {
        self.points += 5
    }
     func missNote() {
        self.hp -= 1
    }
    func getHp() -> Int {
        return self.hp
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
                .position(x: geometry.frame(in: .global).maxX/1.1, y: geometry.frame(in: .global).maxY/25)
            ZStack{
                Rectangle()
                    .frame(width: 110, height: 50, alignment: .center)
                    .foregroundColor(.blue)
                    .border(Color.black, width: 1)
                    .cornerRadius(10.0, antialiased: true)

                Text("Points: " + String(curPlayer.points))
            }
                .position(x: geometry.frame(in: .global).maxX/15, y: geometry.frame(in: .global).maxY/25)
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
