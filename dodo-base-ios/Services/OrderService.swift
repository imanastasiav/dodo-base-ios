//
//  OrderService.swift
//  newApp1
//
//  Created by Анастасия on 14.10.2025.
//

import Foundation

final class ProductsinCart {
    var title: String
    var description: String
    var size: String?
    var price: Int
    var count: Int
    var image: String
    
    init(title: String, description: String, size: String? = nil, price: Int, count: Int = 1, image: String = "hawaii") {
        self.title = title
        self.description = description
        self.size = size
        self.price = price
        self.count = count
        self.image = image
    }
}

final class Order {
    
    var products: [ProductsinCart]
    
    var totalPrice: Int {
        
        var result = 0
        for product in products {
            result += product.count * product.price
        }
        return result
    }
    
    var count: Int {
        var result = 0
        for product in products {
            result += product.count 
        }
        return result
    }
    
    init(products: [ProductsinCart]) {
        self.products = products
    }
}

final class OrderService {
    
    var order = Order.init(products: [
        ProductsinCart(title: "Гавайская", description: "Тесто, Cыр, Буженина", size: "Средняя 30 см, традиционное тесто", price: 690),
        ProductsinCart(title: "Маргарита", description: "Тесто, Cыр, Колбаска", size: "Средняя 30 см, традиционное тесто", price: 590),
        ProductsinCart(title: "Пепперони", description: "Тесто, Cыр, Перец, \nТомат, Лук", size: "Средняя 30 см, традиционное тесто", price: 590),
    ])
}
