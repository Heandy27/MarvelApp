import Foundation

protocol CharacterRepositoryProtocol {
    func getCharacters() async -> [Results]
}
