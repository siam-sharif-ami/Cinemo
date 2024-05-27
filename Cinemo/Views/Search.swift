//
//  Search.swift
//  Cinemo
//
//  Created by BS00484 on 17/5/24.
//

import SwiftUI

struct Search: View {
    @State var searchedString: String = ""
    @State var searchViewModel = SearchViewModel()
    @State private var searchedMovies = MovieListModel.examples()
    @State private var searchTask: Task<Void, Never>?
    
    var body: some View {
        
        ZStack{
            
            Color(.black)
                .ignoresSafeArea()
            
            VStack(alignment: .leading){
                HStack{
                    Text("Search.")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Spacer()
                    Image(systemName: "slider.vertical.3")
                        .resizable()
                        .frame(width: 20,height: 20)
                }
                .padding(EdgeInsets(top: 10, leading: 15, bottom: 5, trailing: 15))
                .foregroundColor(.white)
                
                HStack{
                    Image(systemName: "magnifyingglass")
                    TextField("Search...", text: $searchedString)
                        .autocapitalization(.none)
                        .autocorrectionDisabled(true)
                        .onChange(of: searchedString){ newValue in
                            searchTask?.cancel()
                            Task.init {
                                try? await Task.sleep(nanoseconds: 500_500_500)
                                if !Task.isCancelled{
                                    await searchViewModel.fetchSearchData(search: newValue)
                                }
                            }
                        }
                }.foregroundColor(.white)
                .padding()
                    .background(Color(.systemGray))
                    .cornerRadius(20)
                
                
                ScrollView{
                    if  !searchedString.isEmpty &&  searchViewModel.SearchData != nil {
                        LazyVStack{
                            if let movie = searchViewModel.SearchData?.data.movies{
                                
                                ForEach(movie){ phase in
                                    SearchTabView(search: phase)
                                    
                                }
                            }
                            
                        }
                    }else {
                        Text("No Matches Found")
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                }.padding()
            }
            
            //Text("Previous Search")
            .font(.footnote)
            .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
        }
    }
}


#Preview {
    Search()
}
