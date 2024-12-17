import Foundation

@Observable
final class CharacterDetailViewModel {
    // Publicados
    var seriesData: [ResultSeries] = []
    var characterData: Results
    // No publicado
    @ObservationIgnored
    private var useCase: SeriesUseCaseProtocol
    
    init(useCase: SeriesUseCaseProtocol = SeriesUseCase(), characterData: Results) {
        self.useCase = useCase
        self.characterData = characterData
        
        Task {
            await getSeries(id: characterData.id)
        }
    }
    
    @MainActor
    func getSeries(id: Int) async  {
        let data = await useCase.getSeries(id: id)
        seriesData = data
    }
    
}
