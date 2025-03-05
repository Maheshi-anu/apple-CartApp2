//
//  ContentView.swift
//  CartApp2
//
//  Created by Maheshi Anuradha on 2024-12-03.
//

import SwiftUI

struct ContentView: View {
    
    @State var shopItems = [
        ShopItem(name: "Broccoli", price: 8.00, quantity: 0),
        ShopItem(name: "Banana", price: 10.00, quantity: 0),
        ShopItem(name: "Chicken", price: 20.00, quantity: 0),
        ShopItem(name: "Avocado", price: 7.00, quantity: 0),
        ShopItem(name: "Water", price: 5.00, quantity: 0)
    ]
    
    @State var showCartView: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List(shopItems.indices, id: \.self) { index in
                    HStack {
                        Image(shopItems[index].name.lowercased())
                            .resizable()
                            .frame(width: 60, height: 60)
                        
                        VStack(alignment: .leading){
                            Text("\(shopItems[index].name)")
                            
                            Text("$ \(shopItems[index].price, specifier: "%.1f")")
                                .fontWeight(.bold)
                        }
                        Stepper("", value: $shopItems[index].quantity, in: 0...10)
                        Text("\(shopItems[index].quantity)")
                        
                    }
                }
                .padding()
                .listStyle(PlainListStyle())
                
                Button {
                    showCartView.toggle()
                }
                label : {
                    Text("Checkout")
                }
                .buttonStyle(.bordered)
                .tint(.green)
                
            }
            .navigationDestination(isPresented: $showCartView){
                CartView(shopItems: $shopItems)
            }
            .navigationTitle("Buy Fresh Groceries")
        }
    }
}

#Preview {
    ContentView()
}
