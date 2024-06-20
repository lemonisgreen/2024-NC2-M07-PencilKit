import Foundation
import PencilKit

class DataModel: ObservableObject {
    
    @Published var items: [Item] = []
    
    init() {
        if let documentDirectory = FileManager.default.documentDirectory {
            let urls = FileManager.default.getContentsOfDirectory(documentDirectory).filter { $0.isImage }
            for index in 0..<urls.count {
                let item = Item(url: urls[index], title: "드로잉\(index+16)")
                items.append(item)
            }
        }

        if let urls = Bundle.main.urls(forResourcesWithExtension: "jpg", subdirectory: nil) {
            for index in 0..<urls.count {
                let item = Item(url: urls[index], title: "드로잉\(index)")
                items.append(item)
            }
            // 정렬 함수 정의
            func extractNumber(from title: String) -> Int {
                let numberString = title.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
                return Int(numberString) ?? 0
            }

            // items 배열을 title 속성의 숫자를 기준으로 내림차순 정렬합니다.
            items.sort { extractNumber(from: $0.title) > extractNumber(from: $1.title) }
        }

        // 디버깅을 위해 정렬된 아이템들의 타이틀을 출력합니다.
        for item in items {
            print(item.title)
        }
    }
    
    /// Adds an item to the data collection.
    func addItem(_ item: Item) {
        items.insert(item, at: 0)
    }
    
    /// Removes an item from the data collection.
    func removeItem(_ item: Item) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
            FileManager.default.removeItemFromDocumentDirectory(url: item.url)
        }
    }
}

extension URL {
    /// Indicates whether the URL has a file extension corresponding to a common image format.
    var isImage: Bool {
        let imageExtensions = ["jpg", "jpeg", "png", "gif", "heic"]
        return imageExtensions.contains(self.pathExtension)
    }
}

