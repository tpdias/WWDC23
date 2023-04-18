import SwiftUI

struct MenuView: View {
    @EnvironmentObject var curPlayer: Player
    var body: some View {
        VStack(alignment: .center, spacing: 40){
            Text("Piano Reading")
                .font(.largeTitle)
                .font(.headline)
                .foregroundColor(.black)
                .shadow(color: .red, radius: 10, x: 0.0, y: 0.0)
            Button(action: {curPlayer.startGame()}, label: {
                ZStack{
                    Image(systemName: "play.circle")
                        .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                        .frame(width: 100, height: 100, alignment: .center)
                        .foregroundColor(.black)
                }
            })
            Button(action: {curPlayer.startTutorial()}, label: {
                ZStack{
                    Rectangle()
                        .frame(width: 200, height: 80, alignment: .center)
                        .border(Color.black, width: 1)
                        .cornerRadius(10.0, antialiased: true)
                        .foregroundColor(.red)
                        .opacity(0.8)
                    
                    Text("Tutorial")
                        .font(.headline)
                        .foregroundColor(.black)
                }
            })
            }
        }
    }


struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
