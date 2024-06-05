//
//  anotherTestView.swift
//  Cinemo
//
//  Created by BS00484 on 27/5/24.
//

import SwiftUI

struct FilterView: View {
        @ObservedObject  var searchViewModel: SearchViewModel
        @Binding var isSheetPresented: Bool
        @Binding var searchedString: String
        
        let gridItems = Array(repeating: GridItem(.flexible(), spacing: 10), count: 4)
        
        var body: some View {
            
            ZStack{
                
                VStack(alignment: .leading){
                    Text("Select SortBy")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    HStack {
                        ForEach(SortBy.allCases.filter {$0 != .none}, id: \.self){ sort in
                            Button(action: {
                                searchViewModel.toggleSortState(sort)
                                searchViewModel.toggleSortSelection(sort)
                                
                            }, label: {
                                if searchViewModel.getSortState(sort) {
                                    Text("\(sort.rawValue)")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .frame(width: 80, height: 40)
                                        .background(
                                            Capsule()
                                                .fill(Color.blue)
                                        )
                                }else {
                                    Text("\(sort.rawValue)")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .frame(width: 80, height: 40)
                                        .background(
                                            Capsule()
                                                .stroke(Color.white,lineWidth: 1)
                                        )
                                    
                                }
                            })
                        }
                    }
                    
                    Text("Select Genre")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    LazyVGrid(columns: gridItems, spacing: 10) {
                        ForEach(Genres.allCases.filter{ $0 != .none }, id: \.self) { genre in
                            Button(action: {
                                searchViewModel.toggleGenreSelection(genre)
                                searchViewModel.toggleGenreState(genre)
                            }) {
                                if searchViewModel.getGenreState(genre) {
                                    Text("\(genre.rawValue)")
                                        .lineLimit(1)
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .frame(width: 80, height: 40)
                                        .background(
                                            Capsule()
                                                .fill(Color.blue)
                                        )
                                } else {
                                    Text("\(genre.rawValue)")
                                        .font(.caption)
                                        .lineLimit(1)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .frame(width: 80, height: 40)
                                        .background(
                                            Capsule()
                                                .stroke(Color.white, lineWidth: 1)
                                        )
                                }
                            }
                        }
                    }
                    
                    Text("Select OrderBy")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    HStack {
                        ForEach(OrderBy.allCases.filter{ $0 != .none }, id: \.self){ order in
                            Button(action: {
                                searchViewModel.toggleOrderState(order)
                                searchViewModel.toggleOrderSelection(order)
                            }, label: {
                                if searchViewModel.getOrderState(order) {
                                    Text("\(order.rawValue)")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .frame(width: 80, height: 40)
                                        .background(
                                            Capsule()
                                                .fill(Color.blue)
                                        )
                                }else {
                                    Text("\(order.rawValue)")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .frame(width: 80, height: 40)
                                        .background(
                                            Capsule()
                                                .stroke(Color.white,lineWidth: 1)
                                        )
                                }
                            })
                        }
                    }
                    
                    HStack{
                        Spacer()
                        Button(action: {
                            isSheetPresented = false
                            searchViewModel.fetchSearchData(searchedString: searchedString, selectedOrder: searchViewModel.selectedOrder.rawValue, selectedSortBy: searchViewModel.selectedSortBy.rawValue)
                            
                        }, label: {
                            Text("Apply")
                                .padding()
                                .foregroundColor(.white)
                                .frame(width: 80, height: 40)
                                .background(
                                    Capsule()
                                        .fill(Color.blue)
                                        
                                )
                        })
                    }.padding()
                    
                }.padding()
                    .onAppear(){
                        searchViewModel.initGenreState()
                        searchViewModel.initOrderState()
                        searchViewModel.initSortState()
                        
                        searchViewModel.initSelectedOrder()
                        searchViewModel.initSelectedSortBy()
                    }
            }
        }
    
}

#Preview {
    FilterView(searchViewModel: SearchViewModel(), isSheetPresented: .constant(true), searchedString: .constant("Once"))
}
