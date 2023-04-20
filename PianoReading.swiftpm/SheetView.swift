import SwiftUI


struct SheetView: View {
    @EnvironmentObject var curNote: Note
    @EnvironmentObject var curPlayer: Player
    
    //Timer
    let timer = Timer.publish(
        every: 0.01,       
        tolerance: 0.1, 
        on: .main,     
        in: .common     
    ).autoconnect()
    //Offset
    @State var offset: CGSize = .zero
    //to hide the note when it resets
    @State var reseting: Double = 1
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack(spacing: 0){
                //Designing the Score rectangle by rectangle
                ForEach(1...10,
                        id: \.self
                ){ index in
                    //white rectangles with border
                    ZStack(alignment: .bottomTrailing) {
                        if(index == 5 || index == 6) {
                            //middle rectangles, less opacity
                            Rectangle()
                                .opacity(0.5)
                                .frame(width: UIScreen.main.bounds.width*3.5, height: UIScreen.main.bounds.height/20)
                                .border(Color.black, width: 1)
                        }
                        else {
                            Rectangle()
                                .fill(.white)
                                .frame(width: UIScreen.main.bounds.width*3.5, height: UIScreen.main.bounds.height/20)
                                .border(Color.black, width: 1)
                        }
                    }
                }
            }
            .position(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/3)
            
            //clefs
            Image("treble-clef")
                .resizable()
                .frame(width: 350, height: 180, alignment: .center)
                .position(x: UIScreen.main.bounds.width/10, y: UIScreen.main.bounds.height/5)
            Image("bass-clef")
                .resizable()
                .frame(width: 90, height: 100, alignment: .center)
                .position(x: UIScreen.main.bounds.width/10, y: UIScreen.main.bounds.height/2.22)
            //Notes
            HStack{
                NoteView()
                    .environmentObject(curPlayer)
                    .environmentObject(curNote)
                    .position(x: geometry.size.width + geometry.size.width*0.1, y: UIScreen.main.bounds.height/1.97)
                    .frame(width: UIScreen.main.bounds.width/26, height: UIScreen.main.bounds.height/25, alignment: .center)
                    .opacity(curNote.reseting)
                    .offset(offset)
            }
            .onReceive(timer) { (_) in
                //timer atualization
                curNote.reseting = 1     //hide note on 0
                curNote.positionX -= 1 * geometry.size.width * 0.0015 * curNote.speed // move note
                //offset of the note
                let curOffset = CGSize(
                    width: curNote.positionX,
                    height: -curNote.positionY
                )
                //show note if moves 200 units
                if(curNote.positionX < -200){
                    curNote.reseting = 1
                }
                //if moves more then the screen width collide and change note
                if(abs(curNote.positionX) > abs(geometry.size.width*1.1)){
                    curNote.collision()
                    curNote.changeNote(y: (UIScreen.main.bounds.height), curPlayer: curPlayer)
                    curPlayer.missNote()
                }
                self.offset = curOffset
            }
        }
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}
