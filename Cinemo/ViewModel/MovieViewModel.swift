//
//  MovieViewModel.swift
//  Cinemo
//
//  Created by BS00484 on 17/5/24.
//

import Foundation

@Observable
class MovieViewModel{
    let networkCall: NetworkCall
    var statusResponse: StatusResponse?
    
    init(networkCall: NetworkCall = NetworkCall()) {
        self.networkCall = networkCall
        
    }
    @MainActor
    func fetchStatusData() async{
        do{
            statusResponse = try await networkCall.fetchStatusData()
        }catch{
            print("Problem in status view model")
        }
    }
}
