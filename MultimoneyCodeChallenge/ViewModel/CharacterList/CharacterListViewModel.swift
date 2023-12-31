//
//  CharacterListViewModel.swift
//  MultimoneyCodeChallenge
//
//  Created by Eduardo Hernandez on 18/07/23.
//

import Foundation
import MultimoneyAPI

class CharacterListViewModel: ObservableObject {
    @Published var characters: [CharacterResultViewModel] = []
    private let networkService: Network
    
    init(networkService: Network) {
        self.networkService = networkService
    }
    
    func fetchCharacters() {
        networkService.fetchCharacters { result in
            switch result {
            case .success(let characters):
                DispatchQueue.main.async {
                    self.characters = characters.map(CharacterResultViewModel.init)
                }
            case .failure(let error):
                // Handle error
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}

struct CharacterResultViewModel {
    fileprivate let characterResult: GetCharacterListQuery.Data.Characters.Result?
    
    var id: ID {
        characterResult?.id ?? ""
    }
    
    var name: String {
        characterResult?.name ?? ""
    }
    
    var gender: String {
        characterResult?.gender ?? ""
    }
    
    var image: String {
        characterResult?.image ?? ""
    }
    
    var species: String {
        characterResult?.species ?? ""
    }
    
    var chevronImgName: String {
        "chevron.right"
    }
    
    var episode: [GetCharacterListQuery.Data.Characters.Result.Episode?] {
        characterResult?.episode ?? []
    }
}

struct EpisodeResultViewModel {
    fileprivate let episodeResult: GetCharacterListQuery.Data.Characters.Result.Episode?
    
    var id: ID {
        episodeResult?.id ?? ""
    }
    
    var name: String {
        episodeResult?.name ?? ""
    }
}
