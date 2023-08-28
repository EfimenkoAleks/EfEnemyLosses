//
//  ListModel.swift
//  EfEnemyLosses
//
//  Created by user on 26.08.2023.
//

import Foundation

struct EquipmentObject: Codable {
    var payload: Payload
}

struct Payload: Codable {
    var blob: Blob
}

struct Blob: Codable {
    var rawLines: [String]
}

struct Equipment: Codable {
    var equipment: String?
    var model: String?
    var manufacturer: String?
    var losses: String?
    var equipmentUA: String?
    
    private enum CodingKeys: String, CodingKey {
        case equipment = "equipment_oryx"
        case model
        case manufacturer
        case losses = "losses_total"
        case equipmentUA = "equipment_ua"
    }
}
