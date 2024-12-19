import Foundation



final class CharacterRepository: CharacterRepositoryProtocol {
    
    private var network: CharactersNetworkProtocol
    
    init(network: CharactersNetworkProtocol = CharactersNetwork()) {
        self.network = network
    }
    
    func getCharacters() async -> [Results] {
        return await network.getCharacters()
    }
}

// Mock
final class CharacterRepositoryMock: CharacterRepositoryProtocol {
    
    private var network: CharactersNetworkProtocol
    
    init(network: CharactersNetworkProtocol = CharacterNetworkMock()) {
        self.network = network
    }
    
    func getCharacters() async -> [Results] {
        return await network.getCharacters()
    }
}
