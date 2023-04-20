import SwiftUI

struct ThirdPageView: View {
    @Binding var present: Bool
    var body: some View {
        ZStack{
            Color.white
            VStack{
                
                HStack{
                    Image("flatExemple")
                        .resizable()
                        .frame(width: 300, height: 200, alignment: .center)
                    Image("FindTheFlat")
                        .resizable()
                        .frame(width: 100, height: 200, alignment: .center)
                        .border(Color.black, width: 1)
                }
                Text("The Flat Notes")
                    .font(.largeTitle)
                    .padding(20)
                
                Text("The flat notes are played with the black keys, to find wich black key you should play, you must find the white key refering to the position of the note and play the black key to the left of this white key. The image above shows an A note and how to find the Ab, the A flat note.")
                    .frame(width: 900, height: 200, alignment: .center)
                    .bold()
                    .padding(20)
                Button(action: {
                    present = false
                }, label: {
                    Text("Start")
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
                .padding(20)
            }
            
            .foregroundColor(.black)
            .padding()
            
        }
    }
}
