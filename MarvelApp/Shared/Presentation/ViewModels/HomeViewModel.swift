import Foundation

@Observable
final class HomeViewModel {
    // Publicados
    var charactersData: [Results] = []
    var searchText: String = ""
    // No publicados
    @ObservationIgnored
    private var useCase: CharactersUseCaseProtocol
    
    init(useCase: CharactersUseCaseProtocol = CharactersUseCase()) {
        self.useCase = useCase
        Task {
            await getCharacters()
        }
        
    }
    
    // Filtrar al personaje
    var filteredCharacters : [Results] {
        if searchText.isEmpty {
            return charactersData
        } else {
            return charactersData.filter { $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    // Recibimos los personajes
    @MainActor
    func getCharacters() async {
        let data = await useCase.getCharacters()
        self.charactersData = data
        
    }
}
