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
}
