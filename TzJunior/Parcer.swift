//
//  Parcer.swift
//  TzJunior
//
//  Created by kripsenqq on 18.06.2024.
//

import Foundation

var billUrl1 = "https://rickandmortyapi.com/api/character"
var billUrl2 = "https://rickandmortyapi.com/api/character?page=2"

func fetchCharacters() async throws -> RickAndMortyResponse {
    guard let url1 = URL(string: billUrl1), let url2 = URL(string: billUrl2) else {
        throw URLError(.badURL)
    }
    
    do {
        // Отправка первого запроса
        let (data1, _) = try await URLSession.shared.data(from: url1)
        
        // Проверка корректности JSON для первого ответа
        do {
            _ = try JSONSerialization.jsonObject(with: data1, options: [])
        } catch {
            print("Invalid JSON format for URL1. Error: \(error)")
            throw error
        }
        
        // Декодирование первого ответа
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response1 = try decoder.decode(RickAndMortyResponse.self, from: data1)
        
        // Отправка второго запроса
        let (data2, _) = try await URLSession.shared.data(from: url2)
        
        // Проверка корректности JSON для второго ответа
        do {
            _ = try JSONSerialization.jsonObject(with: data2, options: [])
        } catch {
            print("Invalid JSON format for URL2. Error: \(error)")
            throw error
        }
        
        // Декодирование второго ответа
        let response2 = try decoder.decode(RickAndMortyResponse.self, from: data2)
        
        // Объединение результатов
        let combinedResults = response1.results + response2.results
        let combinedResponse = RickAndMortyResponse(results: combinedResults)
        
        // Возвращение объединенных данных
        print("Received JSON data: \(combinedResponse)")
        print(combinedResponse.results)
        return combinedResponse

    } catch let decodingError as DecodingError {
        // Обработка ошибки декодирования
        print("Error decoding JSON:", decodingError)
        throw decodingError

    } catch {
        // Обработка других ошибок
        print("Error reading data:", error)
        throw error
    }
}
