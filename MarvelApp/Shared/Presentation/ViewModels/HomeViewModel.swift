import Foundation

@Observable
final class HomeViewModel {
    var charactersData: [Results] = []
    var searchText: String = ""
    @ObservationIgnored
    private var useCase: CharactersUseCaseProtocol
    
    init(useCase: CharactersUseCaseProtocol = CharactersUseCase()) {
        self.useCase = useCase
        Task {
            await getCharacters()
        }
        
    }
    

    var filteredCharacters : [Results] {
        if searchText.isEmpty {
            return charactersData
        } else {
            return charactersData.filter { $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    @MainActor
    func getCharacters() async {
        let data = await useCase.getCharacters()
        self.charactersData = data
        
    }
}
