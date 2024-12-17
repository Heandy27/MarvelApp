//
//  XCTestPresentation.swift
//  MarvelAppTests
//
//  Created by Andy Heredia on 17/12/24.
//

import XCTest
@testable import MarvelApp

final class XCTestPresentation: XCTestCase {
    // MARK: - ViewModels
    // HomeViewModel
    func testHomeViewModel() async throws {
        let viewModel = HomeViewModel(useCase: CharactersUseCaseMock())
        XCTAssertNotNil(viewModel)
        let expectation = self.expectation(description: "Get Characters")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            expectation.fulfill()
        }
        await(fulfillment(of: [expectation], timeout: 5))
        // It should return 2 fake characters
        XCTAssertEqual(viewModel.charactersData.count, 2)
    }
    // CharacterDetailViewModel
    
    func testCharacterDetailViewModel() async throws {
        let viewModel = CharacterDetailViewModel(useCase: SeriesUseCaseMock(), characterData: Results(id: 1, name: "3-D Man", description: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", fileExtension: "jpg")))
        
        XCTAssertNotNil(viewModel)
        let expectation = self.expectation(description: "Get Series Characters")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            expectation.fulfill()
        }
        
        await(fulfillment(of: [expectation], timeout: 5))
        // SeriesData Count
        XCTAssertEqual(viewModel.seriesData.count, 2)
        // CharacterData Model
        XCTAssertEqual(viewModel.characterData.id, 1)
        XCTAssertEqual(viewModel.characterData.name, "3-D Man")
        XCTAssertEqual(viewModel.characterData.description, "")
        XCTAssertEqual(viewModel.characterData.thumbnail.path, "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784")
        XCTAssertEqual(viewModel.characterData.thumbnail.fileExtension, "jpg")
        // GetID
        let characterId = viewModel.characterData.id
        let getSeriesMock = await viewModel.getSeriesMock(id: characterId)
        XCTAssertEqual(getSeriesMock , 1)
        
    }
    
//    func testAppState() async throws {
//        let viewModel = AppStateVM(characterUseCase: CharactersUseCaseMock())
//        XCTAssertNotNil(viewModel)
//        
//        let expectation = self.expectation(description: "Get Characters")
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            expectation.fulfill()
//        }
//        
//        await(fulfillment(of: [expectation],timeout: 5))
//        let viewModelGetCharacters = await viewModel.getCharacters()
//        XCTAssertEqual(viewModelGetCharacters, 2)
//        
//    }
    
    // MARK: - Presentation UI
    
   
}
