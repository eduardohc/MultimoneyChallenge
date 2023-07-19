//
//  Network.swift
//  MultimoneyCodeChallenge
//
//  Created by Eduardo Hernandez on 18/07/23.
//

import Foundation
import Apollo
import MultimoneyAPI

class Network {
    static let shared = Network()
    
    private let apollo: ApolloClient
    
    private init() {
        let url = URL(string: "https://rickandmortyapi.com/graphql")!
        apollo = ApolloClient(url: url)
    }
    
    func fetchCharacters(completion: @escaping (Result<[GetCharacterListQuery.Data.Characters.Result?], Error>) -> Void) {
        let query = GetCharacterListQuery()
        
        apollo.fetch(query: query) { result in
            switch result {
            case .success(let graphQLResult):
                if let characters = graphQLResult.data?.characters?.results {
                    completion(.success(characters))
                } else if let errors = graphQLResult.errors {
                    let errorDescriptions = errors.map { $0.localizedDescription }
                    let error = NSError(domain: "GraphQL", code: 0, userInfo: [NSLocalizedDescriptionKey: errorDescriptions])
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
