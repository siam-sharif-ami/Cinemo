//
//  WatchListViewModel.swift
//  Cinemo
//
//  Created by BS00484 on 30/5/24.
//

import Foundation

@Observable
class WatchListViewModel: ObservableObject{
    
    var watchList: [MovieListModel] = []{
        didSet{
            saveItems()
        }
    }
    
    init() {
        getItems()
    }
    
    let itemsKey: String = "items_list"
    
    func getItems(){
        guard 
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([MovieListModel].self, from: data)
        else { return }
        
        self.watchList = savedItems
    }
    
    func runtimeFormat(_ runtime: Int ) -> String {
        return "\(runtime/60)h \(runtime%60)m"
    }
    func onDelete(indexSet: IndexSet){
        watchList.remove(atOffsets: indexSet)
    }
    func onAdd(add movie: MovieListModel){
        if !watchList.contains(where: {$0.id == movie.id }){
            watchList.append(movie)
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(watchList) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
}
