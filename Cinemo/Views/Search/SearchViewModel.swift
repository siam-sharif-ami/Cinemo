//
//  SearchViewModel.swift
//  Cinemo
//
//  Created by BS00484 on 24/5/24.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject{
    
    private var cancellables = Set<AnyCancellable>()
    @Published var SearchData: MovieDatabase?
    @Published var selectedGenres: Set<Genres> = []
    @Published var genreState:[String: Bool] = [:]
    @Published var selectedOrder:OrderBy = OrderBy.none
    @Published var orderState:[String:Bool] = [:]
    @Published var selectedSortBy:SortBy = SortBy.none
    @Published var sortState:[String: Bool] = [:]
    
    
    var searchRepository: MovieRepositoryProtocol
    
    init(searchRepository: MovieRepositoryProtocol = NetworkMovieRepository()) {
        self.searchRepository = searchRepository
    }
    
    func fetchSearchData(searchedString: String, selectedOrder: String, selectedSortBy: String) {
        searchRepository.fetchSearchData(searchedString: searchedString,selectedOrder: selectedOrder, selectedSortBy: selectedSortBy)
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
    
    func initGenreState () {
        Genres.allCases.forEach{ genre in
            self.genreState[genre.rawValue] = false
        }
    }
    func toggleGenreSelection(_ genre: Genres) {
        if selectedGenres.contains(genre){
            selectedGenres.remove(genre)
        }else {
            selectedGenres.insert(genre)
        }
    }
    func toggleGenreState(_ genre: Genres){
        if let currentState = genreState[genre.rawValue] {
            genreState[genre.rawValue] = !currentState
        }
    }
    func getGenreState(_ genre:Genres) -> Bool {
        return genreState[genre.rawValue] ?? false
    }
    
    
    func initSelectedOrder(){
        self.selectedOrder = OrderBy.none
    }
    func initOrderState() {
        OrderBy.allCases.forEach{ order in
            self.orderState[order.rawValue] = false
        }
    }
    func toggleOrderSelection(_ order: OrderBy) {
        self.selectedOrder = order
        print("\(selectedOrder.rawValue)")
    }
    func toggleOrderState(_ order: OrderBy){
        OrderBy.allCases.forEach{ order in
            self.orderState[order.rawValue] = false
        }
        self.orderState[order.rawValue] = true
        print(orderState)
    }
    func getOrderState(_ order:OrderBy) -> Bool {
        return self.orderState[order.rawValue] ?? false
    }
    
    
    func initSelectedSortBy(){
        selectedSortBy = SortBy.none
    }
    func initSortState() {
        SortBy.allCases.forEach{ sort in
            sortState[sort.rawValue] = false
        }
    }
    func toggleSortSelection(_ sort: SortBy) {
        selectedSortBy = sort
        
    }
    func toggleSortState(_ sort: SortBy){
        SortBy.allCases.forEach{ sort in
            sortState[sort.rawValue] = false
        }
        sortState[sort.rawValue] = true
        
    }
    func getSortState(_ sort:SortBy) -> Bool {
        return sortState[sort.rawValue] ?? false
    }
    
    
    //    let networkCall: NetworkCall
    
    //    var SearchData: MovieDatabase?
    
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
