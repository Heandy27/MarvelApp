//
//  CharacterRepositoryProtocol.swift
//  MarvelApp
//
//  Created by Andy Heredia on 8/12/24.
//


protocol CharacterRepositoryProtocol {
    func getCharacters() async -> [Results]
}