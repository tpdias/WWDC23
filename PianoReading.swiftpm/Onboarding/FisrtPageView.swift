import SwiftUI

struct FirstPageView: View {
    @Binding var currentTab: Int
    var body: some View {
        ZStack{
            Color.white
            VStack{
                Image("print")
                    .resizable()
                    .frame(width: 670, height: 400, alignment: .center)
                    .border(Color.black, width: 1)
                Text("Welcome!")
                    .font(.largeTitle)
                    .padding(10)
                
                Text("This App is based on Guitar Hero, but played with a real piano score, the notes will apear on the score and you need to play the correct note in the keyboard using the touchscreen before it get's to the end. If you have no experience playing the piano, you can try the tutorial to get use to the scores. The normal mode is made for training the reading, it has no assistence.")
                    .frame(width: 900, height: 200, alignment: .center)
                    .bold()
                    .padding(10)
                Button(action: {
                    currentTab += 1
                }, label: {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 16)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.red)
                        )
                })
                .shadow(color: .purple, radius: 10)
                .padding(10)
            }
            
            .foregroundColor(.black)
            .padding()
            
        }
    }
}
