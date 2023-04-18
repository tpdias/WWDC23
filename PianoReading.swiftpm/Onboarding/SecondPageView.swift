import SwiftUI

struct SecondPageView: View {
    var body: some View {
        ZStack{
            Color.white
            VStack{
                
                Text("How to read the piano sheet")
                    .font(.largeTitle)
                    .padding(20)
                
                Text("Start by locating the clef's, on the left side of the sheet, it shows where the clef note is, just like the image shows, the trable clef is used usualy on the top and locates the G, sheet and the base clef on the bottom sheet and it locates the F note. The notes are ordened from the bottom to the top.")
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

struct SecondPageView_Previews: PreviewProvider {
    static var previews: some View {
        SecondPageView()
    }
}

