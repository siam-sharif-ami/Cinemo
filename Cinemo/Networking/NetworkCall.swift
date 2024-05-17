//
//  NetworkCall.swift
//  Cinemo
//
//  Created by BS00484 on 17/5/24.
//

import Foundation

func fetchMovieData() async throws -> [Movie] {
    
    let endPoint = "https://yts.mx/api/v2/list_movies.json?sort_by=popular&order_by=desc"
    
    guard let url = URL(string: endPoint) else {
        throw fetchMovieError.invalidURL
        
    }
    
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        throw fetchMovieError.invalidResponse
    }
    do {
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode([Movie].self, from: data)
        return decodedData
    } catch {
        throw fetchMovieError.invalidData
    }
    
}

enum fetchMovieError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
