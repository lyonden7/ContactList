//
//  ListDetailViewController.swift
//  ContactList
//
//  Created by Денис Васильев on 21.12.2022.
//

import UIKit

class ListDetailViewController: UITableViewController {
    
    // MARK: - Public Properties
    var persons: [Person]!

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        persons.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        persons[section].fullName
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let phoneNumberCell = tableView.dequeueReusableCell(withIdentifier: "phoneNumberCell", for: indexPath)
        let emailCell = tableView.dequeueReusableCell(withIdentifier: "emailCell", for: indexPath)

        let person = persons[indexPath.section]
        
        var phoneNumberContent = phoneNumberCell.defaultContentConfiguration()
        var emailContent = emailCell.defaultContentConfiguration()
        
        phoneNumberContent.text = person.phoneNumber
        phoneNumberContent.image = UIImage(systemName: "phone")
        
        emailContent.text = person.email
        emailContent.image = UIImage(systemName: "tray")
        
        phoneNumberCell.contentConfiguration = phoneNumberContent
        emailCell.contentConfiguration = emailContent

        return indexPath.row == 0 ? phoneNumberCell : emailCell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
