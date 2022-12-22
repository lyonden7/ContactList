//
//  Person.swift
//  ContactList
//
//  Created by Денис Васильев on 21.12.2022.
//

// MARK: - Model
struct Person {
    let name: String
    let surname: String
    let email: String
    let phoneNumber: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}

// MARK: - Extension - get instance
extension Person {
    static func getPerson() -> [Person] {
        var persons: [Person] = []
        let dataStore = DataStore()
        
        dataStore.names.shuffle()
        dataStore.surnames.shuffle()

        for item in 0..<dataStore.names.count {
            dataStore.emails.append("\(dataStore.names[item])_\(dataStore.surnames[item])@icloud.com".lowercased())
        }
        
        for _ in 0..<dataStore.names.count {
            dataStore.phoneNumbers.append("+7495\(Int.random(in: 1000000...9999999))")
        }
        
        for item in 0..<dataStore.names.count {
            persons.append(
                Person(
                    name: dataStore.names[item],
                    surname: dataStore.surnames[item],
                    email: dataStore.emails[item],
                    phoneNumber: dataStore.phoneNumbers[item]
                )
            )
        }
        
        return persons
    }
}

// MARK: - DataStore class
class DataStore {
    var names = ["John", "Sharon", "Aaron", "Steven", "Nikola", "Ted", "Bruce", "Carl", "Allan", "Tim"]
    var surnames = ["Smith", "Dow", "Isaacson", "Pennyworth", "Jankins", "Murphy", "Williams", "Black", "Robertson", "Butler"]
    
    /// Массив заполянется в методе getPerson(), основываясь на полученных перемешанных именах и фамилиях
    var emails: [String] = []
    /// Массив заполянется в методе getPerson() рандомными 7-значными числами с заготовленным префиксом +7495
    var phoneNumbers: [String] = []
}
