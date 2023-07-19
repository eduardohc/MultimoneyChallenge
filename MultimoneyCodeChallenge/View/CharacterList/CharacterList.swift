//
//  CharacterList.swift
//  MultimoneyCodeChallenge
//
//  Created by Eduardo Hernandez on 18/07/23.
//

import SwiftUI

import URLImage // Third party API to get images from URL

struct CharacterList: View {
    @ObservedObject var characterListVM: CharacterListViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                List(characterListVM.characters, id: \.id) { character in
                    
                    NavigationLink(destination: CharacterDetailView(character: character)) {
                        HStack {
                            if let imageUrl = URL(string: character.image) {
                                URLImage(imageUrl) { image in
                                    image
                                        .resizable()
                                        .frame(width: 36, height: 36)
                                        .clipShape(Circle())
                                }
                            }
                            
                            Text("\(character.name)")

                        }
                        .padding([.top, .bottom], 2)
                    }
                }
                .navigationTitle("Rick & Morty characters")
                .navigationBarTitleDisplayMode(.inline)
                
                /*
                 Uncomment to see pagination simulation. Note: There is a call to API but nothing happend until we make some changes but for purposes of the main goal. There were no modifications.
                 
                 
                 PaginationView(characterListVM: characterListVM)
                 */
            }
        }
        .onAppear {
            // Fetch data using apollo in Network service file
            characterListVM.fetchCharacters()
        }
    }
}

struct CharacterList_Previews: PreviewProvider {
    static var previews: some View {
        CharacterList(characterListVM: CharacterListViewModel(networkService: Network.shared))
    }
}

// TODO: - This Pagination view was created to demostrate how I will implement pagination with its own views. See comment above.

struct PaginationView: View {
    @ObservedObject var characterListVM: CharacterListViewModel
    @StateObject var paginationManager = PaginationManager()
    @State var page: Int = 1
    
    var body: some View {
        HStack {
            Button(action: {
                paginationManager.decrementPage()
                page = paginationManager.currentPage
                characterListVM.fetchCharacters()
            }, label: {
                HStack {
                    Image(systemName: "chevron.left")
                    Text("Previous")
                }
            })
            .padding(.leading, 15)
            .foregroundColor(page >= 2 ? .red : .gray)
            .disabled(page >= 2 ? false : true)
            
            Spacer()
            
            HStack {
                
                Text("\(page >= 2 ? "\(page - 1)" : "")")
                    .fontWeight(.thin).opacity(0.7)
                Text("\(page)")
                Text("\(page <= 41 ? "\(page + 1)" : "")")
                    .fontWeight(.thin).opacity(0.7)
            }
            
            Spacer()
            
            Button(action: {
                paginationManager.incrementPage()
                page = paginationManager.currentPage
                characterListVM.fetchCharacters()
            }, label: {
                HStack {
                    Text("Next")
                    Image(systemName: "chevron.right")
                }
            })
            .padding(.trailing, 15)
            .foregroundColor(page <= 41 ? .red : .gray)
            .disabled(page <= 41 ? false : true)
        }
    }
}
