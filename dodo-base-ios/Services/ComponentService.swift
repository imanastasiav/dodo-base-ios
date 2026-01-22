//
//  ComponentService.swift
//  newApp1
//
//  Created by Анастасия on 19.10.2025.
//

import UIKit
import SnapKit

final class ComponentService {
    
    func fetchComponents() -> [Component] {
        
        return [
            Component(name: "Сырный бортик", price: 205, image: "Cheese"),
            Component(name: "Пряная говядина", price: 139, image: "SpicyBeef"),
            Component(name: "Моцарелла", price: 90, image: "Mozzarella"),
            Component(name: "Сыры чеддер и пармезан", price: 79, image: "Cheeses"),
            Component(name: "Сыры блю чиз", price: 169, image: "BlueCheese"),
            Component(name: "Острый перец халапенью", price: 59, image: "Jalapenos"),
            Component(name: "Нежный цыпленок", price: 79, image: "GentleChicken"),
            Component(name: "Шампиньоны", price: 59, image: "Champignon"),
            Component(name: "Бекон", price: 99, image: "Bacon"),
            Component(name: "Ветчина", price: 99, image: "Bacon"),
            Component(name: "Острая чоризо", price: 79, image: "SpicyChorizo"),
            Component(name: "Маринованные огурчики", price: 59, image: "PickledCucumbers"),
            Component(name: "Свежие томаты", price: 59, image: "FreshTomatos"),
            Component(name: "Красный лук", price: 59, image: "RedOnion"),
            Component(name: "Сочные ананасы", price: 59, image: "JuicyPineapples"),
            Component(name: "Пикантная пепперони", price: 79, image: "SpicyPepperoni"),
            Component(name: "Итальянские травы", price: 59, image: "ItalianHerbs"),
            Component(name: "Сладкий перец", price: 59, image: "SweetPepper"),
            Component(name: "Кубики брынзы", price: 79, image: "CheeseCubes"),
            Component(name: "Баварские колбаски", price: 129, image: "BavarianSausages"),
            Component(name: "Креветки", price: 229, image: "Shrimps"),
        ]
    }
}
