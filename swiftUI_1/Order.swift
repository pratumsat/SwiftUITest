//
//  Order.swift
//  iDine
//
//  Created by Paul Hudson on 27/06/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import SwiftUI

class Order : ObservableObject {
    @Published var items = [MenuItem]()
    @Published var favorite = [MenuItem]()
    
    static let instance = Order()
    init() {
        
    }
    init(favorite: [MenuItem]) {
        self.favorite = favorite
    }
    init(items: [MenuItem]) {
        self.items = items
    }
    var total: Int {
        if items.count > 0 {
            return items.reduce(0) { $0 + $1.price! }
        } else {
            return 0
        }
    }

    func add(item: MenuItem) {
        items.append(item)
    }
    func addFav(item: MenuItem) {
        item.favorite = true
        favorite.append(item)
    }
    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
    func removeFav(item: MenuItem) {
        item.favorite = false
        if let index = favorite.firstIndex(of: item) {
            favorite.remove(at: index)
        }
    }
}
