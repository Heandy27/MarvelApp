import Foundation

final class SeriesRepository: SeriesRepositoryProtocol {
    
    private var network: SeriesNetworkProtocol
    
    init(network: SeriesNetworkProtocol = SeriesNetwork()) {
        self.network = network
    }
    
    
    func getSeries(id: Int) async -> [ResultSeries] {
        return await network.getSeries(id: id)
    }
}


// Mock

final class SeriesRepositoryMock: SeriesRepositoryProtocol {
    
    private var network: SeriesNetworkProtocol
    
    init(network: SeriesNetworkProtocol = SeriesNetworkMock()) {
        self.network = network
    }
    
    func getSeries(id: Int) async -> [ResultSeries] {
        return await network.getSeries(id: id)
    }
}
