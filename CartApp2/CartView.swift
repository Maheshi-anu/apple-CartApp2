//
//  HomeView.swift
//  CartApp2
//
//  Created by Maheshi Anuradha on 2024-12-03.
//

import SwiftUI

struct CartView: View {
    
    @Binding var shopItems: [ShopItem]
    @State var total : Double = 0.0
    @AppStorage("previousTotal") var previousTotal : Double = 0.0
    
    func calculateTotalQuantity(item: ShopItem) -> Double {
        let newPrice = item.price * Double(item.quantity)
        return newPrice
    }
    
    func calculateTotalAmount() {
        for item in shopItems {
            total += calculateTotalQuantity(item: item)
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section("Purchased Items"){
                        ForEach(shopItems.indices, id: \.self) { shopItem in
                            HStack {
                                Text("\(shopItems[shopItem].name)")
                                Spacer()
                                Text("\(calculateTotalQuantity(item: shopItems[shopItem]), specifier: "%.1f")")
                            }
                        }
                    }
                    
                    Section("Payment Details"){
                        HStack {
                            Text("Net Amount ")
                            Spacer()
                            Text("\(total, specifier: "%.1f")")
                        }
                        
                    }
                }
                .listStyle(.plain)
                .padding()
                
                Text("Your Previous Deal with Us was $ \(previousTotal, specifier: "%.1f")")
                    .frame(width: 350, height: 50)
                    .fontWeight(.bold)
                    .background(Color.green)
                    .cornerRadius(10)
                    .foregroundColor(Color.white)
                    .padding()
                
             }
            .navigationTitle("My Cart")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(){
                calculateTotalAmount()
            }
            .onDisappear(){
                previousTotal = total
            }
        }
    }
}

#Preview {
    CartView(shopItems: .constant(dummyShopItems))
}
