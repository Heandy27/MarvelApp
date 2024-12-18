//
//  XCTestPresentation.swift
//  MarvelAppTests
//
//  Created by Andy Heredia on 17/12/24.
//

import XCTest
import SwiftUI
import ViewInspector

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

    
    // MARK: - Presentation UI
    // CharacterGridList UI
    func testCharacterGridList() throws {
        @State var appStateVM = AppStateVM(characterUseCase: CharactersUseCaseMock())
        XCTAssertNotNil(appStateVM)
        
        // Instancio la vista
       let sut = CharacterGridList(viewModel: HomeViewModel())
            .environment(appStateVM)
        
        
        let nStack = try sut.inspect().implicitAnyView().navigationStack()
        XCTAssertEqual(nStack.count, 1)
        
        let scrollView = try sut.inspect().find(ViewType.ScrollView.self)
        XCTAssertNoThrow(scrollView)
        
        
        let forEach = try sut.inspect().find(ViewType.ForEach.self)
        XCTAssertNoThrow(forEach)

    }
    
    // CharacterDetailView UI
    func testCharacterDetailView() throws {
        @State var characterDetailViewModel = CharacterDetailViewModel(characterData: Results(id: 1, name: "3-D Man", description: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", fileExtension: "jpg")))
        XCTAssertNotNil(characterDetailViewModel)
        
        let sut = CharacterDetailView(viewModel: characterDetailViewModel)
        
        let scrollView = try sut.inspect().implicitAnyView().scrollView()
        
        let vStack = try scrollView.vStack()
        XCTAssertEqual(vStack.count, 1)
        
    }
    
    // SingleSeriesView UI
    
    func testSingleSeriesView() throws {
        @State var singleSeriesView = SingleSeriesView(singleSeriesData: ResultSeries(id: 01, title: "Captain America", description: "From German", thumbnail: ThumbnailSeries(path: "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/514a2ed3302f5", fileExtension: ".jpg")))
        
        XCTAssertNotNil(singleSeriesView)
        
        let sut = SingleSeriesView(singleSeriesData: ResultSeries(id: 01, title: "Captain America", description: "From German", thumbnail: ThumbnailSeries(path: "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/514a2ed3302f5", fileExtension: ".jpg")))
        
        let vStack = try sut.inspect().implicitAnyView().vStack()
        XCTAssertEqual(vStack.count, 2)
        
        let vStack2 = try vStack.vStack(1)
        XCTAssertEqual(vStack2.count, 2)
        
        let titleText = try vStack2.text(0).string()
        XCTAssertEqual(titleText, singleSeriesView.singleSeriesData.title)
        
        let descriptionText = try vStack2.text(1).string()
        XCTAssertEqual(descriptionText, singleSeriesView.singleSeriesData.description)
    }
    
    // HomeListViewCell
    
    func testHomeListViewCell() throws {
        @State var homelistViewCell = HomeListViewCell(characterData: Results(id: 1, name: "3-D Man", description: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", fileExtension: "jpg")))
        XCTAssertNotNil(homelistViewCell)
        
        let sut = HomeListViewCell(characterData: Results(id: 1, name: "3-D Man", description: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", fileExtension: "jpg")))
        
        let vStack = try sut.inspect().implicitAnyView().vStack()
        XCTAssertEqual(vStack.count, 2)
        
        let characterNameText = try vStack.text(1).string()
        XCTAssertEqual(characterNameText, homelistViewCell.characterData.name)
        
        
    }
    
    
    
    
   
}
