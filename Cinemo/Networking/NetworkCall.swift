//
//  NetworkCall.swift
//  Cinemo
//
//  Created by BS00484 on 17/5/24.
//

import Foundation

class NetworkCall{
    
    func fetchMovieDatabase() async throws -> MovieDatabase {
        
        let endPoint = "https://yts.mx/api/v2/list_movies.json?sort_by=popular&order_by=desc"
        
        guard let url = URL(string: endPoint) else {
            throw fetchMovieError.invalidURL
            
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        //print(String(data: data, encoding: .utf8))
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw fetchMovieError.invalidResponse
        }
        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(MovieDatabase.self, from: data)
            return decodedData
        } catch {
            throw fetchMovieError.invalidData
        }
        
    }
    func fetchSearchData(searchedString: String) async throws -> MovieDatabase{
        let endPoint = "https://yts.mx/api/v2/list_movies.json?query_term=\(searchedString)"
        
        print(endPoint)
        
        guard let url = URL(string: endPoint) else {
            throw fetchSearchResponseError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw fetchSearchResponseError.invalidResponse
        }
        
        do{
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(MovieDatabase.self, from: data)
            return decodedData
        }catch{
            throw fetchSearchResponseError.invalidData
        }
    }
}

enum fetchMovieError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

enum fetchStatusResponseError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

enum fetchSearchResponseError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
