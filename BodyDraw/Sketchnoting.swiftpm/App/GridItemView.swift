import SwiftUI

struct GridItemView: View {
    let size: Double
    let item: Item
    
    
    var body: some View {
        VStack{
            AsyncImage(url: item.url) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: CGFloat(size))
            } placeholder: {
                ProgressView()
            }
            Text(item.title)
                .font(.title2)
        }
    }
}
