//
//  CharacterDetailView.swift
//  MultimoneyCodeChallenge
//
//  Created by Eduardo Hernandez on 19/07/23.
//

import SwiftUI
import URLImage

struct CharacterDetailView: View {
    var character: CharacterResultViewModel
    
    var body: some View {
        VStack {
            Spacer().frame(height: 30)
            if let imageUrl = URL(string: character.image) {
                URLImage(imageUrl) { image in
                    image
                        .resizable()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                }
            }
            
            Text(character.name)
                .font(.title)
            
            // Character section detail view was declared below to DRY
            CharacterSectionDetailView(image_name: "figure.dress.line.vertical.figure", text: "\(character.gender)")
            
            CharacterSectionDetailView(image_name: "person.fill.questionmark", text: "\(character.species)")
            
            CharacterSectionDetailView(image_name: "film.stack", text: "\(character.name) episodes")
            
            Spacer()
            
            ScrollView {
                ForEach(character.episode, id: \.self) { episode in
                    if let episodeResult = episode, let episodeName = episodeResult.name {
                        HStack {
                            Text(episodeName)
                                .padding(.leading)
                            Spacer()
                        }
                        .frame(height: 35, alignment: .leading)
                        .background(.gray.opacity(0.05))
                        .cornerRadius(10)
                        .padding([.leading, .trailing], 15)
                    }
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
    }
}

struct CharacterSectionDetailView: View {
    var image_name: String
    var text: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: image_name)
                    .resizable()
                    .fixedSize()
                    .foregroundColor(Color.black)
                    .padding(.trailing, 12)
                Text(text)
                    .font(Font.custom("Montserrat-SemiBold", size: 18))
                    .foregroundColor(Color.black.opacity(0.8))
                Spacer()
            }
            .padding(.leading, 15)
            .frame(height: 60, alignment: .leading)
            .frame(maxWidth: .infinity)
        }
        .background(.gray.opacity(0.2))
        .cornerRadius(15)
        .padding([.leading, .trailing], 15)
        
    }
}
