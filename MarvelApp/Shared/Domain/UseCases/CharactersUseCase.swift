import Foundation

protocol CharactersUseCaseProtocol {
    var repo: CharacterRepositoryProtocol { get set }
    func getCharacters() async -> [Results]
}

final class CharactersUseCase: CharactersUseCaseProtocol {
    var repo: CharacterRepositoryProtocol
    
    init(repo: CharacterRepositoryProtocol = CharacterRepository(network: CharactersNetwork())) {
        self.repo = repo
    }
    
    func getCharacters() async -> [Results] {
        return await repo.getCharacters()
    }
}



final class CharactersUseCaseMock: CharactersUseCaseProtocol {
    var repo: CharacterRepositoryProtocol
    
    init(repo: CharacterRepositoryProtocol = CharacterRepository(network: CharacterNetworkMock())) {
        self.repo = repo
    }
    
    func getCharacters() async -> [Results] {
        return await repo.getCharacters()
    }
}
