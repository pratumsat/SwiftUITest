//
//  ContentView.swift
//  swiftUI_1
//
//  Created by thnawat on 14/12/2563 BE.
//
import SwiftUI

struct ContentView: View {
    
    var menu =  Bundle.main.decode([MenuSection].self, from: "menu.json")
    

    var body: some View {
        NavigationView {
            List {
                ForEach(menu) { section in
                    Section(header: Text(section.name)) {
                        ForEach(section.items) { item in
                            Cell(item: item)
                        }
                    }
                }
            }

            .navigationBarTitle("Menu")
            .listStyle(DefaultListStyle())
             
        } 
     
        
    }

}

struct ContentView_Previews: PreviewProvider {
   
    static var previews: some View {
        ContentView()
    }
}
