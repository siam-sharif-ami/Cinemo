//
//  Search.swift
//  Cinemo
//
//  Created by BS00484 on 17/5/24.
//

import SwiftUI

struct Search: View {
    @State var searchedString: String = ""
    
    @StateObject var searchViewModel: SearchViewModel = SearchViewModel()
    @State private var searchedMovies = MovieListModel.examples()
    @State private var searchTask: Task<Void, Never>?
    @State private var loaded:Bool = false
    @State private var isSheetPresented:Bool = false
    
    var body: some View {
        
        NavigationView{
            ZStack{
                
                VStack(alignment: .leading){
                    HStack{
                        Text("Search.")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        Spacer()
                        Spacer()
                        Button {
                            isSheetPresented.toggle()
                        } label: {
                            Image(systemName: "slider.vertical.3")
                                .resizable()
                                .frame(width: 20,height: 20)
                        }.sheet(isPresented: $isSheetPresented, content: {
                            FilterView(searchViewModel: searchViewModel, isSheetPresented: $isSheetPresented, searchedString: $searchedString)
                        })
                    }
                    .padding(EdgeInsets(top: 10, leading: 15, bottom: 5, trailing: 15))
                    .foregroundColor(.primary)
                    
                    HStack{
                        Image(systemName: "magnifyingglass")
                        TextField("Search...", text: $searchedString)
                            .autocapitalization(.none)
                            .autocorrectionDisabled(true)
                            .onChange(of: searchedString){
                                newValue in
                                searchTask?.cancel()
                                loaded = false
                                
                                Task.init {
                                    try? await Task.sleep(nanoseconds: 1000000000)
                                    if !Task.isCancelled{
                                        searchViewModel.fetchSearchData(searchedString: newValue,selectedOrder: searchViewModel.selectedOrder.rawValue, selectedSortBy:  searchViewModel.selectedSortBy.rawValue)
                                        loaded = true
                                    }
                                }
                            }
                    }
                    .padding()
                    .cornerRadius(20)
                    .foregroundColor(.primary)

                    
                    
                    ScrollView(.vertical,showsIndicators: false){
                        if loaded == false && !searchedString.isEmpty{
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: (.pink)))
                            
                        }else {
                            if  !searchedMovies.isEmpty {
                                LazyVStack{
                                    
                                    ForEach( searchedMovies ){ phase in
                                        NavigationLink(destination: DetailsView(movieComing: phase)){
                                            SearchTabView(search: phase)
                                        }
                                    }
                                }
                                
                            }else {
                                    Text("No Matches Found")
                                        .font(.subheadline)
                                        .foregroundColor(.primary)
                            }
                        }
                    }
                }
                
                .font(.footnote)
                .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
            }
        }
        .onReceive(searchViewModel.$SearchData) { newSearchData in
            loaded = true
            if let listOfMovies = newSearchData?.data.movies {
                var filteredByGenre = searchViewModel.filterMoviesByGenres(movies: listOfMovies, selectedGenres: searchViewModel.selectedGenres)
                print(filteredByGenre)
                searchedMovies = filteredByGenre
            } else {
                
                searchedMovies = []
            }
        }
        .onAppear(){
            searchViewModel.initGenreState()
            searchViewModel.initOrderState()
            searchViewModel.initSortState()
            
            searchViewModel.initSelectedOrder()
            searchViewModel.initSelectedSortBy()
        }
    }
}


#Preview {
    Search()
        .environmentObject(WatchListViewModel())
}
