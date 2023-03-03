//
//  String+Extension.swift
//  Yummie
//
//  Created by Berkay Kuzu on 12.12.2022.
//

import Foundation

extension String { // we convert String to URL.
    var asUrl: URL? {
        return URL(string: self)
    }
}
