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
    
    var categories: [Title] = [] {
        didSet {
            self.reloadCollection?()
        }
    }
    init() {
        getCategories()
        getItems()
    }
    
    func getCategoryName(i: Int) -> Title {
        let categoryName = categories[index]
        return categoryName
    }
    
    func getCategoryCount() -> Int {
        return categories.count
    }
    
    func getItems() {
        Repository.shared.getItems { res in
            self.items = res[self.index].data
        }
    }
    func getItem(i: Int) -> Items {
        let desc = items[i].description
        let id = items[i].id
        let image = items[i].image
        return Items(description: desc, id: id, image: image)
    }
    
    func getCategories() {
        Repository.shared.getItems { res in
            self.categories = res
        }
    }
    func getItemsCount()->Int {
        return items.count
    }
    
    var reloadCollection: (()->())?
}
