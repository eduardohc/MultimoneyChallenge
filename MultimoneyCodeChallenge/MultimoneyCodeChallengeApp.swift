//
//  MultimoneyCodeChallengeApp.swift
//  MultimoneyCodeChallenge
//
//  Created by Eduardo Hernandez on 18/07/23.
//

import SwiftUI

@main
struct MultimoneyCodeChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            CharacterList(characterListVM: CharacterListViewModel(networkService: Network.shared))
        }
    }
}
