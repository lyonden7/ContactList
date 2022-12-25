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
    
    var rows: [String] {
        [phoneNumber, email]
    }
}

// MARK: - Extension - get instance
extension Person {
    static func getPersons() -> [Person] {
        var persons: [Person] = []
        let dataStore = DataStore.shared
        
        let names = dataStore.names.shuffled()
        let surnames = dataStore.surnames.shuffled()

        for index in 0..<names.count {
            dataStore.emails.append("\(names[index])_\(surnames[index])@icloud.com".lowercased())
        }
        
        for index in 0..<names.count {
            let person = Person(
                name: names[index],
                surname: surnames[index],
                email: dataStore.emails[index],
                phoneNumber: dataStore.phoneNumbers[index]
            )

            persons.append(person)
        }
        
        return persons
    }
}

enum Contacts: String {
    case phone = "phone"
    case email = "tray"
}


