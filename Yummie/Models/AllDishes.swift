//
//  AllDishes.swift
//  Yummie
//
//  Created by Berkay Kuzu on 4.03.2023.
//

import Foundation

struct AllDishes: Codable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}
