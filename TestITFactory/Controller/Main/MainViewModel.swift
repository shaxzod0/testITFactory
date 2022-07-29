//
//  MainViewModel.swift
//  TestITFactory
//
//  Created by Shaxzod Azamatjonov on 29/07/22.
//

import UIKit

class MainViewModel {
    
    var index: Int = 0 {
        didSet {
            self.reloadCollection?()
        }
    }
    
    var items: [Items] = [] {
        didSet {
            self.reloadCollection?()
        }
    }
    
    var categories: [HealthyFood] = [] {
        didSet {
            self.reloadCollection?()
        }
    }
    init() {
        fetchItems()
    }
    
    func getCategoryName(i: Int) -> String {
        return categories[i].title_name
    }
    
    func getCategoryCount() -> Int {
        return categories.count
    }
    
    func fetchItems() {
        Repository.shared.getItems { res in
            self.items = res[self.index].data
            self.categories = res
        }
    }
    func getItem(i: Int) -> Items {
        let desc = items[i].description
        let id = items[i].id
        let image = items[i].image
        return Items(description: desc, id: id, image: image)
    }
    
    func getItemsCount()->Int {
        return items.count
    }
    
    var reloadCollection: (()->())?
}
