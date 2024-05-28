//
//  ViewModel.swift
//  Cinemo
//
//  Created by BS00484 on 20/5/24.
//

import Foundation

@Observable
class ViewModel{
    let networkCall: NetworkCall
    
    var movieDatabase: MovieDatabase?
    
    init(networkCall: NetworkCall = NetworkCall()) {
        self.networkCall = networkCall
    }
    
    @MainActor
    func fetchMovieData() async {
        do{
            movieDatabase = try await networkCall.fetchMovieDatabase()
        }catch{
            print("problem in fetching dataClass")
        }
    }
}
