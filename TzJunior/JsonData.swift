//
//  JsonData.swift
//  TzJunior
//
//  Created by kripsenqq on 18.06.2024.
//

import Foundation

enum NetworkingError: Error {
    case badUrl
    case badResponse
}

struct RickAndMortyResponse: Codable {
    let results: [Character]
}

// MARK: - Character
struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Location
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}
