import SwiftUI

struct GridView: View {
    @EnvironmentObject var dataModel: DataModel
    
    private static let columns = 3
    @State private var isAddingPhoto = false
    @State private var isEditing = false
    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: columns)
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: gridColumns) {
                    ForEach(dataModel.items) { item in
                        GeometryReader { geo in
                            NavigationLink(destination: DetailView(item: item)) {
                                GridItemView(size: geo.size.width, item: item)
                            }
                        }
                        .accentColor(.black)
                        .cornerRadius(8.0)
                        .aspectRatio(1, contentMode: .fit)
                        .shadow(color: Color(red: 0.8, green: 0.8, blue: 0.8, opacity: 0.5), radius: 8)
                        .padding()
                        .overlay(alignment: .topTrailing) {
                            if isEditing {
                                Button {
                                    withAnimation {
                                        dataModel.removeItem(item)
                                    }
                                } label: {
                                    Image(systemName: "xmark.circle.fill")
                                        .font(Font.title)
                                        .symbolRenderingMode(.palette)
                                        .foregroundStyle(.white, .black)
                                }
                                .offset(x: 2, y: 0)
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .tint(.black)
        .navigationBarTitle("Template Gallery")
        .accentColor(.black)
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $isAddingPhoto) {
            PhotoPicker()
        } 
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                
                // MARK: - TO DO
                Button(isEditing ? "Done" : "Edit") {
                    withAnimation { isEditing.toggle() }
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isAddingPhoto = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }   .accentColor(.black)
    }
}

struct GridView_Previews: PreviewProvider {   static var previews: some View {
    GridView().environmentObject(DataModel())
        .previewDevice("iPad (8th generation)")
}
}
