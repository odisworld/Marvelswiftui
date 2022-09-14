//
//  HomeViewModel.swift
//  MarvelSwiftUI
//
//  Created by Consultant on 22/08/2022.
//

import SwiftUI
import Combine


import CryptoKit

final class HomeViewModel: ObservableObject {
    @Published var characters: [Character] = []
    
    func MD5(data: String)->String{
        
        let hash = Insecure.MD5.hash(data: data.data(using: .utf8) ?? Data() )
        
        return hash.map{
            String(format: "%02hhx", $0)
        }
        .joined()
    }

    
    var cancellable: AnyCancellable?
   
    
    init() {
        let publicKey = "4885fc50b0153e34bf11c20c28dcebd7"
        let privateKey = "724905a23c74ca24f51ab5e161397df665d6ff6d"
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(data: "\(ts)\(privateKey)\(publicKey)")
        let charactersURL = URL(string: "https://gateway.marvel.com:443/v1/public/characters?orderBy=name&limit=100&ts=\(ts)&apikey=4885fc50b0153e34bf11c20c28dcebd7&hash=\(hash)")!
        cancellable = URLSession.shared.dataTaskPublisher(for: charactersURL)
            .map { $0.data}
            .decode(type: APIResult.self, decoder: JSONDecoder())
            .map { $0.data.results }
            .receive(on: RunLoop.main)
            .replaceError(with: [])
            .eraseToAnyPublisher()
            .assign(to: \.characters, on: self)
    }
    
}

class HeroDetailsViewModel: ObservableObject {
    let character: Character
    let stories: [StoriesItemPresentation]
    let events: [ComicsItemPresentation]
    
    init(hero: Character) {
        self.character = hero
        self.stories = self.character.stories?.items ?? []
        self.events = self.character.events?.items ?? []
        
    }
    
   
}


