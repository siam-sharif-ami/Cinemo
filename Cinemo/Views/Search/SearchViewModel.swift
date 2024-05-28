//
//  SearchViewModel.swift
//  Cinemo
//
//  Created by BS00484 on 24/5/24.
//

import Foundation

@Observable
class SearchViewModel{
    let networkCall: NetworkCall
    
    var SearchData: MovieDatabase?
    
    init(networkCall: NetworkCall = NetworkCall()) {
        self.networkCall = networkCall
    }
    
    @MainActor
    func fetchSearchData(search: String) async {
        do{
            SearchData = try await networkCall.fetchSearchData(searchedString: search)
            print(SearchData)
        }catch {
            print("Problem in fetching search data")
        }
    }
    
    func clearSearchData(){
        SearchData = nil
    }
}
