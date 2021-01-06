//
//  Menu.swift
//  iDine
//
//  Created by Paul Hudson on 27/06/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import SwiftUI

struct MenuSection: Codable , Identifiable {
    var id: UUID
    var name: String
    var items: [MenuItem]
}

class MenuItem: Codable , Identifiable , Equatable {
    static func == (lhs: MenuItem, rhs: MenuItem) -> Bool {
        return lhs.name == rhs.name
    }
    
     
    
    var id: UUID = UUID()
    var name: String?
    var photoCredit: String?
    var price: Int?
    var restrictions: [String]?
    var description: String?
    var favorite: Bool = false

    var mainImage: String {
        name?.replacingOccurrences(of: " ", with: "-").lowercased() ?? ""
    }

    var thumbnailImage: String {
        "\(mainImage)-thumb"
    }
    init(name: String, photoCredit: String, price: Int, restrictions: [String], description: String, favorite: Bool) {
        self.name = name
        self.photoCredit = photoCredit
        self.price = price
        self.restrictions = restrictions
        self.description = description
        self.favorite = favorite
    }
     
    
    #if DEBUG
    static let example = MenuItem(name: "Maple French Toast", photoCredit: "Joseph Gonzalez", price: 6, restrictions: ["G", "V"], description: "Sweet, fluffy, and served piping hot, our French toast is flown in fresh every day from Maple City, Canada, which is where all maple syrup in the world comes from. And if you believe that, we have some land to sell you…", favorite: false)
    #endif
}
