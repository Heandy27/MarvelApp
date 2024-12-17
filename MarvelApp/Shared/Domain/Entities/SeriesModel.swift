import Foundation

struct SeriesModel: Codable {
    let data: DataResult
    let code: Int
}

struct DataResult: Codable {
    let results: [ResultSeries]
}

struct ResultSeries: Codable, Identifiable {
    let id: Int
    var title: String
    let description: String?
    let thumbnail: ThumbnailSeries
}

struct ThumbnailSeries: Codable {
    let path: String
    let fileExtension: String
    
    enum CodingKeys: String, CodingKey {
           case path
           case fileExtension = "extension"  // Aquí enlazamos "extension" con "fileExtension"
       }
}

