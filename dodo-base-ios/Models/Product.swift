//
//  Product.swift
//  newApp1
//
//  Created by Анастасия on 24.09.2025.
//

import UIKit
import SnapKit

struct Category: Codable {
    let name: String
}

struct Product: Codable {
    let name: String
    let detail: String
    let price: Int
    let image: String
    let type: String
}


