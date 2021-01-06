//
//  OrderView.swift
//  swiftUI_1
//
//  Created by thnawat on 4/1/2564 BE.
//

import SwiftUI

struct OrderView: View {
    @ObservedObject var order = Order.instance
      
    
    var body: some View {
        if order.items.count > 0 {
            NavigationView {
                List {
                    Section {
                        ForEach(order.items) { item in
                            HStack{
                                Text(item.name!)
                                Spacer()
                                Text("$\(item.price!)")
                            }
                        }.onDelete(perform: onDelete)

                        }

                        Section {
                            NavigationLink(destination: CheckOutView()) {
                                Text("Place Order")
                            }
                        }
                    }
                    .navigationBarTitle("Order")
                    .listStyle(GroupedListStyle())
                    .navigationBarItems(trailing: EditButton())
                 
            }
        }else{
            HStack {
                Spacer()
                Text("NO ORDER")
                    .font(.headline)
                    .foregroundColor(.gray)
                Spacer()
            }
           
            
        }
    }
    func onDelete(indexSet : IndexSet){
        order.items.remove(atOffsets: indexSet)
    }
    
}

struct OrderView_Previews: PreviewProvider {
    static var order = Order(items : [MenuItem.example])
    static var previews: some View {
        OrderView()

        OrderView(order: order)
    }
}
