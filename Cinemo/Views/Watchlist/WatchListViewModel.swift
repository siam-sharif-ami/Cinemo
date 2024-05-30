//
//  WatchListViewModel.swift
//  Cinemo
//
//  Created by BS00484 on 30/5/24.
//

import Foundation

@Observable
class WatchListViewModel : ObservableObject {
    
    var watchList: [WatchListModel] = []{
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
            let savedItems = try? JSONDecoder().decode([WatchListModel].self, from: data)
        else { return }
    }
    
    func runtimeFormat(_ runtime: Int ) -> String {
        return "\(runtime/60)h \(runtime%60)m"
    }
    func add(id:Int ){
        
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(watchList) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
}
