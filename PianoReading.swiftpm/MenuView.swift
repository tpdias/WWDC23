import SwiftUI

struct MenuView: View {
    @EnvironmentObject var curPlayer: Player
    @Binding var presentOnboarding: Bool
    var body: some View {
        VStack(alignment: .center, spacing: 40){
            //title
            Text("Piano Reading")
                .font(.largeTitle)
                .font(.headline)
                .foregroundColor(.white)
                .shadow(color: .red, radius: 10, x: 0.0, y: 0.0)
            //normal mode button
            Button(action: {curPlayer.startGame()}, label: {
                ZStack{
                    Rectangle()
                        .frame(width: 200, height: 80, alignment: .center)
                        .border(Color.black, width: 1)
                        .cornerRadius(10.0, antialiased: true)
                        .foregroundColor(.red)
                        .saturation(0.8)
                    
                    Text("Normal Mode")
                        .font(.headline)
                        .foregroundColor(.black)
                }
            })
            //tutorial mode button
            Button(action: {curPlayer.startTutorial()}, label: {
                ZStack{
                    Rectangle()
                        .frame(width: 200, height: 80, alignment: .center)
                        .border(Color.black, width: 1)
                        .cornerRadius(10.0, antialiased: true)
                        .foregroundColor(.red)
                        .saturation(0.8)
                    
                    Text("Tutorial Mode")
                        .font(.headline)
                        .foregroundColor(.black)
                }
            })
            //information button
            Button(action: {
                presentOnboarding = true
            }, label: {
                ZStack{
                    Rectangle()
                        .frame(width: 200, height: 80, alignment: .center)
                        .border(Color.black, width: 1)
                        .cornerRadius(10.0, antialiased: true)
                        .foregroundColor(.red)
                        .saturation(0.8)
                    
                    Text("Show Instructions")
                        .font(.headline)
                        .foregroundColor(.black)
                }
            })
            }
        }
    }
