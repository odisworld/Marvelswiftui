//
//  Character.swift
//  marvelapi
//
//  Created by Consultant on 22/08/2022.
//

import SwiftUI

struct APIResult: Codable {
    var data: APICharacterData
}

struct APICharacterData: Codable {
    var count:Int
    var results: [Character]
}

struct Character: Identifiable, Codable {
  var id : Int
  var name: String
  var description: String
    var thumbnail: [String: String]
    var urls: [[String: String]]
    var stories: StoriesPresentation?
    var events: ComicsPresentation?
}

struct StoriesPresentation: Codable {
    let available: Int
    let collectionURI: String
    let items: [StoriesItemPresentation]
    let returned: Int
}

struct StoriesItemPresentation: Codable {
    let resourceURI: String
    let name: String
    let type: String
}

struct ComicsPresentation: Codable {
    let available: Int
    let collectionURI: String
    let items: [ComicsItemPresentation]
    let returned: Int
}

struct ComicsItemPresentation: Codable {
    let resourceURI: String
    let name: String
}
