//
//  DetailView.swift
//  MarvelSwiftUI
//
//  Created by Consultant on 22/08/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    @ObservedObject var heroDetailsViewModel: HeroDetailsViewModel
    let character: Character
    var body: some View {
        ScrollView {
            VStack(spacing: 5){
                WebImage(url: extractImage(data: character.thumbnail))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .cornerRadius(8)
                Text(character.name)
                    .font(Font.system(size:20, weight: .bold, design: .default))
                Text(character.description)
                    .font(Font.system(size:12))
                    .lineLimit(nil)
          //      HeroComicView(items: heroDetailsViewModel.comics)
                StoryView(items: heroDetailsViewModel.stories)
            //    HeroSerieView(items: heroDetailsViewModel.series)
               EventView(items: heroDetailsViewModel.events)
            }
            .padding()
            .navigationBarTitle(character.name)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
private func extractImage(data: [String: String]) -> URL {
    
    let path = data["path"] ?? ""
    let ext = data["extension"] ?? ""
    
    return URL(string: "\(path).\(ext)")!
    
}
