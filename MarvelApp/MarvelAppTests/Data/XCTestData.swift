//
//  XCTestData.swift
//  MarvelAppTests
//
//  Created by Andy Heredia on 17/12/24.
//

import XCTest
@testable import MarvelApp

final class XCTestData: XCTestCase {

 // MARK: - BaseNetwork
    func testNetworkModels() throws {
        
        // Endpoints
        XCTAssertEqual(Endpoints.characters.rawValue, "/v1/public/characters")
        
        // Http Methods
        XCTAssertEqual(HttpMethods.delete, "DELETE")
        XCTAssertEqual(HttpMethods.get, "GET")
        XCTAssertEqual(HttpMethods.put, "PUT")
        XCTAssertEqual(HttpMethods.post, "POST")
        
        // Http Response
        XCTAssertEqual(HttpResponseCode.ERROR, 502)
        XCTAssertEqual(HttpResponseCode.SUCCESS, 200)
        XCTAssertEqual(HttpResponseCode.NOT_AUTHORIZED, 400)
        
        
    }
    
    // MARK: Network
    // Network Characters
    func testCharactersNetwork() async throws {
        let network = CharacterNetworkMock()
        XCTAssertNotNil(network)
        let networkResponse = await network.getCharacters()
        XCTAssertEqual(networkResponse.count, 2)
    }
    // Network Series
    func testSeriesNetwork() async throws {
        let network = SeriesNetworkMock()
        XCTAssertNotNil(network)
        
        let networkResponse = await network.getSeries(id: 0)
        XCTAssertEqual(networkResponse.count, 2)
    }
    
    // MARK: Repositories
    // Character Repository
    func testCharacterRepository() async throws {
        let repository = CharacterRepositoryMock()
        XCTAssertNotNil(repository)
        
        let repositoryResponse = await repository.getCharacters()
        XCTAssertEqual(repositoryResponse.count, 2)
    }
    
    func testSeriesRepository() async throws {
        let repository = SeriesRepositoryMock()
        XCTAssertNotNil(repository)
        
        let respositoryResponse = await repository.getSeries(id: 0)
        XCTAssertEqual(respositoryResponse.count, 2)
    }
    
    

}
