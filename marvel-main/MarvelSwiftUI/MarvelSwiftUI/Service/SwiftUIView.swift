//
//  SwiftUIView.swift
//  MarvelSwiftUI
//
//  Created by Consultant on 22/08/2022.
//

import Foundation

enum Network {
    

  //  let originalQuery = searchQuery.replacingOccurrences(of: " ", with: "%20")
    static let charactersURL = URL(string: "https://gateway.marvel.com:443/v1/public/characters?orderBy=name&limit=100&ts=\(ts)&apikey=4885fc50b0153e34bf11c20c28dcebd7&hash=\(hash)")!

    
 //   static let charactersURL = URL(string: "https://gateway.marvel.com:443/v1/public/characters?orderBy=-modified&limit=100&apikey=4885fc50b0153e34bf11c20c28dcebd7")!
}
