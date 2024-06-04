//
//  SearchViewModel.swift
//  Cinemo
//
//  Created by BS00484 on 24/5/24.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject{
    //    let networkCall: NetworkCall
    
    //    var SearchData: MovieDatabase?
    private var cancellables = Set<AnyCancellable>()
    @Published var SearchData: MovieDatabase?
    var searchRepository: MovieRepositoryProtocol
    
    init(searchRepository: MovieRepositoryProtocol = NetworkMovieRepository()) {
        self.searchRepository = searchRepository
    }
    
    func fetchSearchData(searchedString: String) {
        searchRepository.fetchSearchData(searchedString: searchedString)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching search data: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] data in
                self?.SearchData = data
            })
            .store(in: &cancellables)
    }
    //    @MainActor
    //    func fetchSearchData(search: String) async {
    //        do{
    //            SearchData = try await networkCall.fetchSearchData(searchedString: search)
    //            print(SearchData)
    //        }catch {
    //            print("Problem in fetching search data")
    //        }
    //    }
}
