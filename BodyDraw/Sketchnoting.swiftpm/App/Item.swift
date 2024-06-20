import SwiftUI

struct Item: Identifiable {
    
    let id = UUID()
    let url: URL
    let title: String
    
    init(url: URL, title: String) {
           self.url = url
           self.title = title
       }
}

extension Item: Equatable {
    static func ==(lhs: Item, rhs: Item) -> Bool {
        return lhs.id == rhs.id && lhs.id == rhs.id
    }
}
