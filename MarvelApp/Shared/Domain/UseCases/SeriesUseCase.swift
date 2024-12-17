import Foundation

protocol SeriesUseCaseProtocol {
    var repo: SeriesRepositoryProtocol { get set }
    func getSeries(id: Int) async -> [ResultSeries]
}

final class SeriesUseCase: SeriesUseCaseProtocol {
    var repo: SeriesRepositoryProtocol
    
    init(repo: SeriesRepositoryProtocol = SeriesRepository(network: SeriesNetwork())) {
        self.repo = repo
    }
    
    func getSeries(id: Int) async -> [ResultSeries] {
        return await repo.getSeries(id: id)
    }
}

// Mock
final class SeriesUseCaseMock: SeriesUseCaseProtocol {
    var repo: SeriesRepositoryProtocol
    
    init(repo: SeriesRepositoryProtocol = SeriesRepository(network: SeriesNetworkMock())) {
        self.repo = repo
    }
    
    func getSeries(id: Int) async -> [ResultSeries] {
        return await repo.getSeries(id: id)
    }
}
