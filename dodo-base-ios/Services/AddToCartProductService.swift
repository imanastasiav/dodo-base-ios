//
//  AddToCartProductService.swift
//  newApp1
//
//  Created by Анастасия on 07.11.2025.
//

import UIKit
import SnapKit

final class AddToCartProductService {
    
    func fetchAddProducts() -> [AddToCartProduct] {
        
        return [
            AddToCartProduct(name: "Cоусы", image: "sauses"),
            AddToCartProduct(name: "Добрый Кола от 155₽ ", image: "dobryi0"),
            AddToCartProduct(name: "Добрый Кола без сахар от 155₽", image: "dobryi2"),
        ]
    }
}
