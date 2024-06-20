import SwiftUI
import PencilKit

struct DrawingView: View {
    var image: Image
    @State private var showingAlert = false
    @State private var pkCanvasView = PKCanvasView()
    @State private var isSharing = false
    @State private var isBackgroundHiding = false
    @State private var magnifyBy = 1.0
     
    @available(iOS 17.0, *)
    var magnification: some Gesture {
       MagnifyGesture(minimumScaleDelta: magnifyBy)
         .onChanged { value in
           magnifyBy = value.magnification
         }
     }
    
    private var StickyHeader: some View {
            LazyVStack(pinnedViews: [.sectionHeaders]) {
                Section(header: filterBar) {
                    
                }
            }
        }
        private var filterBar: some View {
            
            HStack {
                Button {
                    isBackgroundHiding.toggle()
                } label: {
                    Image(systemName: isBackgroundHiding ? "eye" : "eye.slash")
                }
                .font(.title)
        
                Spacer()
                
                Button(action: shareDrawing) {
                    Image(systemName: "square.and.arrow.up")
                }.sheet(isPresented: $isSharing) {
                    let image = pkCanvasView.drawing.image(from: pkCanvasView.bounds, scale: UIScreen.main.scale)
                    ShareSheet(
                        activityItems: [image],
                        excludedActivityTypes: [])
                }
                .font(.title)
            }
            .padding(.horizontal, 20)
        }
    
    var body: some View {
        
        StickyHeader

        if #available(iOS 17.0, *) {
            ZStack {
                //            RoundedRectangle(cornerRadius: 20)
                //                .foregroundColor(.white)
                //                .shadow(color: Color(red: 0.8, green: 0.8, blue: 0.8, opacity: 0.5), radius: 8)
                //            
                image
                    .resizable()
                    .scaledToFit()
                    .opacity(isBackgroundHiding ? 0 : 0.3)
                
                PKCanvas(canvasView: $pkCanvasView)
            
//                GeometryReader { geo in
//                    PKCanvas(canvasView: $pkCanvasView)
//                        .frame(width: geo.size.width, height: geo.size.height)
//                        .cornerRadius(20)
//                }
            }
            .border(.black)
            .accentColor(.black)
            .padding(16)
            .scaleEffect(magnifyBy)
            .gesture(magnification)
        } else {
            // Fallback on earlier versions
        }
    }
    
    func shareDrawing() {
        isSharing = true
    }
}

struct DrawingView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingView(image: Image("frames"))
    }
}

