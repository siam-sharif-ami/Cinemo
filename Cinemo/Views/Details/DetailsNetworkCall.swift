//
//  DetailsNetworkCall.swift
//  Cinemo
//
//  Created by BS00484 on 28/5/24.
//

import Foundation

class DetailsNetworkCall {
    
    func fetchMovieDetails(movieID id: Int) async throws  -> MovieDetailsDatabase {
        
        let endPoint = "https://yts.mx/api/v2/movie_details.json?movie_id=\(id)&with_cast=true"
        
        print(endPoint)
        guard let url = URL(string: endPoint) else {
            throw fetchMovieError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)

        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw fetchMovieError.invalidResponse
        }
        print(response.statusCode)
        
        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(MovieDetailsDatabase.self, from: data)
            print(decodedData)
            return decodedData
        } catch {
            throw fetchMovieDetailsError.invalidData
        }
        
    }
}

enum fetchMovieDetailsError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

