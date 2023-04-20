import SwiftUI

struct HowToReadView: View {
    var body: some View {
        ZStack{
            Color.white
            VStack{
                Text("Start by locating the two clefs on the left side of the sheet, they show where the clef specific note is, just like the image shows, the trable clef is used usualy on the top and locates the G note, and the base clef on the bottom and it locates the F note. The notes are ordened from the bottom to the top, so you can count up alphabetically to find every note, they go from A to G and start over after that, you can also count down.")
                    .frame(width: 900, height: 200, alignment: .center)
                    .foregroundColor(.black)
                    .bold()
                    .padding(20)
                Image("howToRead")
                    .resizable()
                    .frame(width: 900, height: 300, alignment: .center)
            }
        }
    }
}
