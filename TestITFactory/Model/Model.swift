//
//  Model.swift
//  TestITFactory
//
//  Created by Shaxzod Azamatjonov on 29/07/22.
//

import Foundation

struct HealthyFood: Codable{
    let title_name: String
    let data: [Items]
}

struct Items: Codable{
    let description: String
    let id: Int
    let image: String
}
