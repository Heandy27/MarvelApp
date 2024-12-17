import Foundation

protocol CharactersNetworkProtocol {
    func getCharacters() async -> [Results]
}

final class CharactersNetwork: CharactersNetworkProtocol {
    func getCharacters() async -> [Results] {
        
        var charactersData: [Results] = []
        
        let urlString = "\(ConstantsApp.CONS_API_URL)\(Endpoints.characters.rawValue)?apikey=\(ConstantsApp.PUBLIC_KEY)&hash=\(ConstantsApp.HASH)&ts=\(ConstantsApp.TS)"
        
        var urlRequest = URLRequest(url: URL(string: urlString)!)
        urlRequest.httpMethod = HttpMethods.get
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard let res = response as? HTTPURLResponse,
                  res.statusCode == HttpResponseCode.SUCCESS else {
                print("Error en statusCode")
                return []
            }
            
            let resultDecodable = try JSONDecoder().decode(CharactersModel.self, from: data)
            
            charactersData = resultDecodable.data.results
            
            
        } catch {
            print("Hubo un error en el data y response")
        }
        
        return charactersData
    }
    
    
}
// https://gateway.marvel.com/v1/public/characters?apikey=a0b03831ffd6e57548acd661a9ac42b5&hash=e8635e2a5aa1eecd943f510a6e6f9131&ts=1


final class CharacterNetworkMock: CharactersNetworkProtocol {
    func getCharacters() async -> [Results] {
        
        let model1 = Results(id: 1, name: "3-D Man", description: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", fileExtension: "jpg"))
        
        let model2 = Results(id: 2, name: "A-Bomb (HAS)", description: "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction!", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16", fileExtension: "jpg"))
        
        return [model1, model2]
    }
    
    
}
