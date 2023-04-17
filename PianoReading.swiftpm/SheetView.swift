//import SwiftUI
//
//
//struct SheetView: View {
//    @EnvironmentObject var curNote: Note
//    @EnvironmentObject var curPlayer: Player
//    
//    //Timer
//    let timer = Timer.publish(
//        every: 0.01,       // Second
//        tolerance: 0.1, // Gives tolerance so that SwiftUI makes optimization
//        on: .main,      // Main Thread
//        in: .common     // Common Loop
//    ).autoconnect()
//    
//    @State var offset: CGSize = .zero
//    @State var reseting: Double = 1
//    
//    var body: some View {
//        
//        GeometryReader { geometry in
//            VStack(spacing: 0){
//                ForEach(1...10,
//                        id: \.self
//                ){ index in
//                    ZStack(alignment: .bottomTrailing) {
//                        if(index == 5 || index == 6) {
//                            Rectangle()
//                                .opacity(0.5)
//                                .frame(width: geometry.size.width*2, height: geometry.frame(in: .global).midY/10)
//                                .border(Color.black, width: 1)
//                        }
//                        else {
//                            Rectangle()
//                                .fill(.white)
//                                .frame(width: geometry.size.width*2, height: geometry.frame(in: .global).midY/10)
//                                .border(Color.black, width: 1)
//                        }
//                    }
//                }
//            }
//            .position(x: geometry.frame(in: .global).midX, y: geometry.frame(in: .global).midY/1.5)
//            
//            //clefs
//            Image("treble-clef")
//                .resizable()
//                .frame(width: 350, height: 180, alignment: .center)
//                .position(x: geometry.frame(in: .global).midX/5, y: geometry.frame(in: .global).midY/2.5)
//            Image("bass-clef")
//                .resizable()
//                .frame(width: 90, height: 100, alignment: .center)
//                .position(x: geometry.frame(in: .global).midX/5, y: geometry.frame(in: .global).midY/1.11)
//            //Notes
//            HStack{
//                NoteView()
//                    .position(x: geometry.frame(in: .global).maxX + geometry.frame(in: .global).maxX/10, y: geometry.frame(in: .global).maxY/1.9)
//                    .frame(width: geometry.frame(in: .global).maxX/26, height: geometry.frame(in: .global).maxY/25, alignment: .center)
//                    .opacity(curNote.reseting)
//                    .offset(offset)
//            }
//            .onReceive(timer) { (_) in
//                curNote.reseting = 1
//                curNote.positionX -= 1 * curNote.speed
//                let curOffset = CGSize(
//                    width: curNote.positionX,
//                    height: -curNote.positionY
//                )
//                if(curNote.positionX < -200){
//                    curNote.reseting = 1
//                }
//                if(abs(curNote.positionX) > abs(geometry.size.width + 300)){
//                    curNote.collision()
//                    curNote.changeNote(y: (geometry.frame(in: .global).maxY))
//                    curPlayer.missNote()
//                }
//                self.offset = curOffset
//            }
//        }
//    }
//}
//
//struct SheetView_Previews: PreviewProvider {
//    static var previews: some View {
//        SheetView()
//    }
//}

import SwiftUI


struct SheetView: View {
    @EnvironmentObject var curNote: Note
    @EnvironmentObject var curPlayer: Player
    
    //Timer
    let timer = Timer.publish(
        every: 0.01,       // Second
        tolerance: 0.1, // Gives tolerance so that SwiftUI makes optimization
        on: .main,      // Main Thread
        in: .common     // Common Loop
    ).autoconnect()
    
    @State var offset: CGSize = .zero
    @State var reseting: Double = 1
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack(spacing: 0){
                ForEach(1...10,
                        id: \.self
                ){ index in
                    ZStack(alignment: .bottomTrailing) {
                        if(index == 5 || index == 6) {
                            Rectangle()
                                .opacity(0.5)
                                .frame(width: UIScreen.main.bounds.width*2, height: UIScreen.main.bounds.height/20)
                                .border(Color.black, width: 1)
                        }
                        else {
                            Rectangle()
                                .fill(.white)
                                .frame(width: UIScreen.main.bounds.width*2, height: UIScreen.main.bounds.height/20)
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
                    .position(x: UIScreen.main.bounds.width + UIScreen.main.bounds.width/10, y: UIScreen.main.bounds.height/1.97)
                    .frame(width: UIScreen.main.bounds.width/26, height: UIScreen.main.bounds.height/25, alignment: .center)
                    .opacity(curNote.reseting)
                    .offset(offset)
            }
            .onReceive(timer) { (_) in
                curNote.reseting = 1
                curNote.positionX -= 1 * curNote.speed
                let curOffset = CGSize(
                    width: curNote.positionX,
                    height: -curNote.positionY
                )
                if(curNote.positionX < -200){
                    curNote.reseting = 1
                }
                if(abs(curNote.positionX) > abs(UIScreen.main.bounds.width + 300)){
                    curNote.collision()
                    curNote.changeNote(y: (UIScreen.main.bounds.height))
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
