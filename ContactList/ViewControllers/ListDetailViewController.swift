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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons[section].rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let person = persons[indexPath.section]
        var content = cell.defaultContentConfiguration()
        
        content.text = person.rows[indexPath.row]
        
        content.image = indexPath.row == 0
        ? UIImage(systemName: Contacts.phone.rawValue)
        : UIImage(systemName: Contacts.email.rawValue)
        
        cell.contentConfiguration = content
        
        return cell
    }
}
    
// MARK: - Table view delegate
extension ListDetailViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as? HeaderViewCell
        let person = persons[section]
        cell?.nameLabel.text = person.name
        cell?.surnameLabel.text = person.surname
        return cell
    }
}
