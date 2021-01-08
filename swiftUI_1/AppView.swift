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
    @State var presentingModal = false
    
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
struct ModalView: View {
  @Binding var show : Bool
  var body: some View {
    ZStack{
            Rectangle()
            .fill(Color.white)
                .opacity(0.5)

            
                
            VStack(spacing: 20) {
                Spacer()
                Text("Name")
                Text("Age")
                Text("Profession")
                Text("Interest")
                Spacer()
            }
            .frame(minWidth: 300, idealWidth: 300, maxWidth: 300, minHeight: 250, idealHeight: 100, maxHeight: 250, alignment: .top)
            .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.white))
            .overlay(RoundedRectangle(cornerRadius: 25.0).stroke(Color.blue, lineWidth: 1.0))
            
        }.onTapGesture {
            self.show = false
        }
  }
}
struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
