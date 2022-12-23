//
//  DataStore.swift
//  ContactList
//
//  Created by Денис Васильев on 23.12.2022.
//

class DataStore {
    static let shared = DataStore()
    
    let names = ["John", "Sharon", "Aaron", "Steven", "Nikola", "Ted", "Bruce", "Carl", "Allan", "Tim"]
    let surnames = ["Smith", "Dow", "Isaacson", "Pennyworth", "Jankins", "Murphy", "Williams", "Black", "Robertson", "Butler"]
    
    /// Массив заполянется в методе getPerson(), основываясь на полученных перемешанных именах и фамилиях
    var emails: [String] = []
    
    var phoneNumbers: [String] {
        var numbers: [String] = []
        for _ in 0..<names.count {
            numbers.append("+7495\(Int.random(in: 1000000...9999999))")
        }
        return numbers
    }
    
    private init() {}
}
