//
//  ShopItem.swift
//  CartApp2
//
//  Created by Maheshi Anuradha on 2024-12-03.
//

import Foundation

struct ShopItem {
    // name: stores grocery item name,
    // hint: lowercased version of this value can be used access the relavent asset
    var name: String
    
    // price: stores grocery item price
    var price: Double
    
    // quantity: stores how many items user wants purchase
    var quantity: Int
    
    init(name: String, price: Double, quantity: Int) {
        self.name = name
        self.price = price
        self.quantity = quantity
    }
}

var dummyShopItems: [ShopItem] = [
    ShopItem(name: "Broccoli", price: 8.00, quantity: 10),
    ShopItem(name: "Banana", price: 10.00, quantity: 10),
    ShopItem(name: "Avocado", price: 7.00, quantity: 0),
    ShopItem(name: "Chicken", price: 20.00, quantity: 0),
    ShopItem(name: "Water", price: 5.00, quantity: 0)
]
