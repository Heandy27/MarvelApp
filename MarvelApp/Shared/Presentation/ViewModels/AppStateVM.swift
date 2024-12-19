import Foundation
import Combine

@Observable
final class AppStateVM {
    // Publicados
    var status: StatusModel = .none
    var charactersData: [Results] = []
    // No publicados
    @ObservationIgnored
    private var characterUseCase: CharactersUseCaseProtocol
    
    init(characterUseCase: CharactersUseCaseProtocol = CharactersUseCase()) {
        self.characterUseCase = characterUseCase
    }
    // Recibimos los personajes
    @MainActor
    func getCharacters()  {
        self.status = .loading
        
        Task {
            if (await characterUseCase.getCharacters()).isEmpty {
                self.status = .error
            } else {
                self.status = .loaded
            }
        }
        
    }
    // Fución de los estados.
    func statusApp() {
        status = .none
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            DispatchQueue.main.async {
                 self.getCharacters()
            }
        }
    }
    
}
