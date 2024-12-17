//
//  XCTestDomain.swift
//  MarvelAppTests
//
//  Created by Andy Heredia on 17/12/24.
//

import XCTest
@testable import MarvelApp


final class XCTestDomain: XCTestCase {
    //MARK: - Models
    // Testeo de un modelo
        func testCharacterResultsModels() throws {
            let characterResultsModel = Results(id: 1, name: "3-D Man", description: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", fileExtension: "jpg"))
            // Que no sea nulo
            XCTAssertNotNil(characterResultsModel)
            // Comparaciones con el modelo
            XCTAssertEqual(characterResultsModel.id, 1)
            XCTAssertEqual(characterResultsModel.name, "3-D Man")
            XCTAssertEqual(characterResultsModel.description, "")
            XCTAssertEqual(characterResultsModel.thumbnail.path, "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784")
            XCTAssertEqual(characterResultsModel.thumbnail.fileExtension, "jpg")
            
        }
        
        func testSeriesResultsModel() throws {
            let seriesResultsModel = ResultSeries(id: 1, title: "Avengers: The Initiative (2007 - 2010)", description: nil, thumbnail: ThumbnailSeries(path: "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/514a2ed3302f5", fileExtension: "jpg"))
            // Que no sea nulo
            XCTAssertNotNil(seriesResultsModel)
            // Comparaciones con el modelo
            XCTAssertEqual(seriesResultsModel.id, 1)
            XCTAssertEqual(seriesResultsModel.title, "Avengers: The Initiative (2007 - 2010)")
            XCTAssertEqual(seriesResultsModel.description, nil)
            XCTAssertEqual(seriesResultsModel.thumbnail.path, "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/514a2ed3302f5")
            XCTAssertEqual(seriesResultsModel.thumbnail.fileExtension, "jpg")
        }

    // MARK: - Usecases
    
    func testCharctersUseCase() async throws {
        let characterUseCase = CharactersUseCase(repo: CharacterRepositoryMock())
        XCTAssertNotNil(characterUseCase)
        
        let characterResponse = await characterUseCase.getCharacters()
        XCTAssertEqual(characterResponse.count, 2)
        
    }
    
    func testSeriesUseCase() async throws {
        
        let seriesUseCase = SeriesUseCase(repo: SeriesRepositoryMock())
        XCTAssertNotNil(seriesUseCase)
        
        let seriesResponse = await seriesUseCase.getSeries(id: 0)
        XCTAssertEqual(seriesResponse.count, 2)
    }
    
    //MARK: - Tools
    func testConstantsApp() throws {
        XCTAssertEqual(ConstantsApp.CONS_API_URL, "http://gateway.marvel.com")
        XCTAssertEqual(ConstantsApp.HASH, "e8635e2a5aa1eecd943f510a6e6f9131")
        XCTAssertEqual(ConstantsApp.TS, "1")
        XCTAssertEqual(ConstantsApp.PUBLIC_KEY, "a0b03831ffd6e57548acd661a9ac42b5")
    }
    
    
}
