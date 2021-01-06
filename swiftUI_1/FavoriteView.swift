//
//  FavoriteView.swift
//  swiftUI_1
//
//  Created by thnawat on 5/1/2564 BE.
//

import SwiftUI

struct FavoriteView: View {
    
    @ObservedObject var order = Order.instance
    
    var body: some View {
        NavigationView{
            List {
                ForEach(order.favorite) { favorite in
                    Cell(item: favorite)
                }
            }
            .navigationTitle("Favorite")
            .listStyle(DefaultListStyle())
        }
        
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var order = Order(favorite : [MenuItem.example])
    static var previews: some View {
        FavoriteView(order:  order)
    }
}
