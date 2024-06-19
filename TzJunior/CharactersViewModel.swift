//
//  CharactersViewModel.swift
//  TzJunior
//
//  Created by kripsenqq on 18.06.2024.
//

import Foundation

class CharactersViewModel: ObservableObject {
    @Published var char: RickAndMortyResponse?

    func fetchUserData() {
        Task {
            do {
                let result = try await fetchCharacters()

                DispatchQueue.main.async {
                    self.char = result
                }
            } catch {
                print("Данные не загрузились: \(error)")
            }
        }
    }
}
