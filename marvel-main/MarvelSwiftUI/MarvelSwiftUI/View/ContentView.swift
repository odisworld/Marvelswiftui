//
//  ContentView.swift
//  MarvelSwiftUI
//
//  Created by Consultant on 22/08/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @ObservedObject private var ViewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            
            List(ViewModel.characters, id: \.id) { character in
                NavigationLink(destination: DetailView(heroDetailsViewModel:HeroDetailsViewModel(hero: character) , character: character)) {
                    HStack {
                        WebImage(url: extractImage(data: character.thumbnail))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .cornerRadius(8)
                        Text(character.name)
                        
                    }
                }//navigation link
            }.navigationBarTitle("MarvelApi-Combine")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

private func extractImage(data: [String: String]) -> URL {
    
    let path = data["path"] ?? ""
    let ext = data["extension"] ?? ""
    
    return URL(string: "\(path).\(ext)")!
    
}
