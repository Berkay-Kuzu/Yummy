//
//  Dish.swift
//  Yummie
//
//  Created by Berkay Kuzu on 13.12.2022.
//

import Foundation

struct Dish {
    let id, name, description, image: String?
    let calories: Int?
    
    var formattedCalories: String {
        return "\(calories ?? 0) calories"
    }
}


