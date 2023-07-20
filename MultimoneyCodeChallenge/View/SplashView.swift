//
//  SplashView.swift
//  MultimoneyCodeChallenge
//
//  Created by Eduardo Hernandez on 19/07/23.
//

import SwiftUI

struct SplashView: View {
    @State var isActive: Bool = false
        
        var body: some View {
            ZStack {
                if self.isActive {
                    CharacterList(characterListVM: CharacterListViewModel(networkService: Network.shared))
                } else {
                    Rectangle()
                        .background(Color.black)
                        .ignoresSafeArea()
                    Image("img_rickAndMorty")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                        .offset(x: -60)
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
