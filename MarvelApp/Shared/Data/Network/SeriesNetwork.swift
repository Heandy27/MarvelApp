import Foundation

protocol SeriesNetworkProtocol {
    func getSeries(id: Int) async -> [ResultSeries]
}

final class SeriesNetwork: SeriesNetworkProtocol {
    func getSeries(id: Int) async -> [ResultSeries] {
        
        var seriesData: [ResultSeries] = []
        
        let urlString = "\(ConstantsApp.CONS_API_URL)\(Endpoints.characters.rawValue)/\(id)/series?apikey=\(ConstantsApp.PUBLIC_KEY)&hash=\(ConstantsApp.HASH)&ts=\(ConstantsApp.TS)"
        
        var request = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = HttpMethods.get
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let res = response as? HTTPURLResponse,
                  res.statusCode == HttpResponseCode.SUCCESS else {
                print("Error en el statusCode SeriesNetwork")
                return []
            }
            
            let resultData = try JSONDecoder().decode(SeriesModel.self, from: data)
            
            seriesData = resultData.data.results
            
            
        } catch {
            print("Error en el parsing data")
        }
        
        
        return seriesData
        
    }
}


final class SeriesNetworkMock: SeriesNetworkProtocol {
    func getSeries(id: Int) async -> [ResultSeries] {
        // id: 1011334
        
        let model1 = ResultSeries(id: 1, title: "Avengers: The Initiative (2007 - 2010)", description: nil, thumbnail: ThumbnailSeries(path: "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/514a2ed3302f5", fileExtension: "jpg"))
        
        let model2 = ResultSeries(id: 1, title: "Deadpool (1997 - 2002)", description: "Wade Wilson: Heartless Merc With a Mouth or...hero? Laugh, cry and applaud at full volume for the mind-bending adventures of Deadpool, exploring the psyche and crazed adventures of Marvel's most unstable personality!", thumbnail: ThumbnailSeries(path: "http://i.annihil.us/u/prod/marvel/i/mg/7/03/5130f646465e3", fileExtension: "jpg"))
        
        return [model1, model2]
    }
    
    
}
