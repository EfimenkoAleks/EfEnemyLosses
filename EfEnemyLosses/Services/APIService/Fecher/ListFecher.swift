//
//  ListFecher.swift
//  EfEnemyLosses
//
//  Created by user on 27.08.2023.
//

import Foundation

class ListFecher: ListFecherProtocol {
    
    private var baseUrlStr: String = "https://github.com/PetroIvaniuk/2022-Ukraine-Russia-War-Dataset/blob/main/data/russia_losses_equipment_oryx.json"
    private var networkService: NetworkServiceProtocol = NetworkService()
    
    func getList(completion: @escaping ([Equipment]) -> Void) {
        networkService.getList(for: URL(string: baseUrlStr)!) { (result: Result<EquipmentObject, Error>) in
            switch result {
            case .success(let model):
                let arr = model.payload.blob.rawLines
                let arr2 = arr.filter({$0.contains(":")})
                var arr3 = arr2.map { str in
                    let filteredChars = "\"\n\t,\\"
                    return str.filter { filteredChars.range(of: String($0)) == nil }
                }
                var arrayStr5: [[String]] = []
                while !arr3.isEmpty {
                    let count = 5
                    let firstCount = Array(arr3.prefix(count))
                    let dropCount = Array(arr3.dropFirst(count))
                    arr3 = dropCount
                    arrayStr5.append(firstCount)
                }
                
                var arrayEquipment: [Equipment] = []
                arrayStr5.forEach { arrayStr in
                    var obj = Equipment()
                    arrayStr.forEach { str in
                        var key: String = ""
                        if let range = str.range(of: ":") {
                            let strWithSpaces = str.substring(to: range.lowerBound)
                            key = strWithSpaces.trimmingCharacters(in: .whitespaces)
                        }
                        var value: String = ""
                        if let range = str.range(of: ":") {
                            value = str[range.upperBound...].trimmingCharacters(in: .whitespaces)
                        }
                        
                        
                        if key == "equipment_oryx" {
                            obj.equipment = value
                        }
                        if key == "model" {
                            obj.model = value
                        }
                        if key == "manufacturer" {
                            obj.manufacturer = value
                        }
                        if key == "losses_total" {
                            obj.losses = value
                        }
                        if key == "equipment_ua" {
                            obj.equipmentUA = value
                        }
                    }
                    arrayEquipment.append(obj)
                    //    print(obj)
                }
                
                arrayEquipment.forEach { element in
                    print(element)
                }
                completion(arrayEquipment)
            case .failure(_):
                completion([])
            }
        }
    }
}
