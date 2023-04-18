import SwiftUI

struct FirstPageView: View {
    
    var body: some View {
        ZStack{
            Color.white
            VStack{
                
                Text("Welcome!")
                    .font(.largeTitle)
                    .padding(20)
                
                Text("This app is based on Guitar Hero, but played with real piano sheet's, the notes will apear on the sheet and you need to play the correct note before it get's to the end.")
                    .bold()
                    .padding(20)
                Button(action: {}, label: {
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

struct FirstPageView_Previews: PreviewProvider {
    static var previews: some View {
        FirstPageView()
    }
}
