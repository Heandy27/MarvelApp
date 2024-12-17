import Foundation

protocol SeriesRepositoryProtocol {
    func getSeries(id:Int) async -> [ResultSeries]
}


