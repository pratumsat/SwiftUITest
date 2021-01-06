//
//  CheckOutView.swift
//  swiftUI_1
//
//  Created by thnawat on 4/1/2564 BE.
//

import SwiftUI

struct CheckOutView: View {
    static let tipAmounts = [10, 15, 20, 25, 0]
    static let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    static let pickuptimes = ["Now", "Tonight", "Tomorrow Morning"]
    @ObservedObject var order = Order.instance
    @State private var paymentType = 0
    @State private var addLoyaltyDetail = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 0
    @State private var isShowingAlert = false
    @State private var pickuptime = 0
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to play?", selection : $paymentType) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                      }
                }
                
                Toggle(isOn: $addLoyaltyDetail) {
                    Text("Add iDine loyalty card")
                }
                if addLoyaltyDetail {
                    TextField("Enter loyalty card", text: $loyaltyNumber)
                }
            }
            
            Section {
                Picker("Pickup Time", selection: $pickuptime) {
                    ForEach(0 ..< Self.pickuptimes.count){
                        Text("\(Self.pickuptimes[$0])")
                    }
                }
            }
            
            Section(header: Text("Add a Tip?")) {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(0 ..< Self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("TOTAL: $\(totalPrice, specifier: "%.2f")").font(.largeTitle)) {
                Button("Confirm Order"){
                    self.isShowingAlert.toggle()
                }
            }
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
        .alert(isPresented: $isShowingAlert) {
            Alert(title: Text("Order confirmed"),
                  message: Text("Your total was $\(totalPrice, specifier: "%.2f") – thank you!"),
                  dismissButton: .default(Text("OK")))
        }
        
    }
    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CheckOutView()
        }
       
    }
}
