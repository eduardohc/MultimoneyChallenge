//
//  PaginationManager.swift
//  MultimoneyCodeChallenge
//
//  Created by Eduardo Hernandez on 19/07/23.
//

import Foundation

class PaginationManager: ObservableObject {
    @Published var currentPage: Int = 1
    
    func incrementPage() {
        currentPage += 1
    }
    
    func decrementPage() {
        if currentPage > 1 {
            currentPage -= 1
        }
    }
    
    func resetPage() {
        currentPage = 1
    }
    
    func getURLWithPageNumber(baseURL: String) -> URL? {
        var components = URLComponents(string: baseURL)
        components?.queryItems = [URLQueryItem(name: "page", value: String(currentPage))]
        return components?.url
    }
}
