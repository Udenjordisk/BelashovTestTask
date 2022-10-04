//
//  EatingData.swift
//  BelashovTestTask
//
//  Created by Кирилл on 03.10.2022.
//

import Foundation

// MARK: - Model
struct Model: Codable {
    let sections: [Section]
}

// MARK: - Section
struct Section: Codable {
    let id, header: String
    let itemsTotal, itemsToShow: Int
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let id: String
    let image: Image
    let title: String
}

// MARK: - Image
struct Image: Codable {
    let the1X, the2X, the3X: String
    let aspectRatio: Int?
    let loopAnimation: Bool?

    enum CodingKeys: String, CodingKey {
        case the1X = "1x"
        case the2X = "2x"
        case the3X = "3x"
        case aspectRatio, loopAnimation
    }
}
