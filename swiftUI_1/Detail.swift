//
//  Detail.swift
//  swiftUI_1
//
//  Created by thnawat on 4/1/2564 BE.
//

import SwiftUI

struct Detail: View {
    var item: MenuItem
    static let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    
    @ObservedObject var order  = Order.instance
    
    var body: some View {
        
        VStack(alignment: .leading) {
            ZStack(alignment : .bottomTrailing) {
                Image(uiImage: UIImage(named: item.mainImage)!)
                    .resizable()
                    .scaledToFit()
                Text("Credit: \(item.photoCredit!)")
                    .padding(4)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .font(.caption)
                    .offset(x: -5, y: -5)
                
                
            }
          
            
            VStack(alignment: .leading) {
                Text(item.name ?? "")
                    .font(.headline)
                Text("$\(item.price!)")
                    .font(.headline)
                Text(item.description!)
                    .font(.subheadline)
                
                HStack{
                    ForEach(item.restrictions!, id: \.self) { restriction in
                        Text(restriction)
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding(5)
                            .background(Self.colors[restriction, default: .black])
                            .clipShape(Circle())
                            .foregroundColor(.white)
                    }
                }
                HStack  {
                    Button(item.favorite ? "Remove Favorite" : "Add Favorite"){
                        
                        if item.favorite {
                            self.order.removeFav(item: item)
                        } else{
                            self.order.addFav(item: item)
                        }
                    }
                    .padding()
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .background(item.favorite ? Color.gray : Color.yellow)
                    .foregroundColor(.white)
                    
                   
                    
 
                    Button("Order This"){
                        self.order.add(item: item)
                    }
                    .padding()
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                     
                     
                }
                
            }.padding()
             
            
            Spacer()
        }
        .navigationBarTitle(Text(item.name!), displayMode: .inline)
        
         
       
    }
  
}

struct Detail_Previews: PreviewProvider {
  
    static var previews: some View {
        NavigationView {
            Detail(item: MenuItem.example)
        }
       
    }
}
