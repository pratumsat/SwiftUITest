//
//  AppView.swift
//  swiftUI_1
//
//  Created by thnawat on 4/1/2564 BE.
//

import SwiftUI

struct AppView: View {
 
    @State private var selectedTab = 0
    @ObservedObject private var order = Order.instance
     
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            TabView(selection: $selectedTab) {
                ContentView()
                    .tabItem {
                        Image(systemName: "list.dash")
                        Text("Menu")
                    }.tag(0)
                OrderView()
                    .tabItem {
                        Image(systemName: "square.and.pencil")
                        Text("Order")
                    }.tag(1)
                FavoriteView()
                    .tabItem {
                        Image(systemName: "star")
                        Text("Favorite")
                    }.tag(2)
            }
            
             
            if showcheckout   {
                Button("Checkout"){
                    self.selectedTab = 1
                    
                }
                .font(.headline)
                .offset(x: -10, y: 10)
                .accessibility(hidden: true)
            } 
            
        }
    }
    var showcheckout : Bool {
        return order.items.count > 0 ? selectedTab != 1 : false
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
