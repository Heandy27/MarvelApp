import Foundation
import CryptoKit

struct CharactersModel: Codable {
    let data: DataModel
  
}

struct DataModel: Codable {
    let results: [Results]
}

struct Results: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail
   // let series: Series
}

struct Thumbnail: Codable {
    let path: String
    let fileExtension: String
    
    enum CodingKeys: String, CodingKey {
           case path
           case fileExtension = "extension"  // Aquí enlazamos "extension" con "fileExtension"
       }
}

//struct Series: Codable {
//    let items: [Items]
//}
//
//struct Items: Codable, Hashable {
//    let resourceURI: String
//    let name: String
//}

