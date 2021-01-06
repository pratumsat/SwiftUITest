//
//  Cell.swift
//  swiftUI_1
//
//  Created by thnawat on 4/1/2564 BE.
//

import SwiftUI

struct Cell: View {
    var item: MenuItem
    static let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
  
    
    var body: some View {
        NavigationLink(destination: Detail(item:item)) {
            HStack {
                Image(uiImage: UIImage(named: item.thumbnailImage)!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2.0))
                    

                VStack(alignment: .leading) {
                    Text(item.name ?? "")
                        .font(.headline)
                    Text("$\(item.price!)")
                        .font(.headline)
                }
                
                
                Spacer()
                
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
        }
    }
}

struct Cell_Previews: PreviewProvider {

    static var previews: some View {
        Cell(item: MenuItem.example)
    }
}
