import Foundation
import Combine

@Observable
final class AppStateVM {
    var status: StatusModel = .none
    var charactersData: [Results] = []
    @ObservationIgnored
    private var characterUseCase: CharactersUseCaseProtocol
    
    init(characterUseCase: CharactersUseCaseProtocol = CharactersUseCase()) {
        self.characterUseCase = characterUseCase
        
      
    }
    
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
    
    func statusApp() {
        status = .none
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            DispatchQueue.main.async {
                 self.getCharacters()
            }
        }
    }
    
}
