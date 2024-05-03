//
//  CatModel.swift
//  23. Modularization-Swift Package Manager
//
//  Created by gvantsa gvagvalia on 5/2/24.
//

import Foundation

public struct CatModel: Codable {
    var data: [Details]?
    
    public struct Details: Codable {
        var fact: String?
    }
}
