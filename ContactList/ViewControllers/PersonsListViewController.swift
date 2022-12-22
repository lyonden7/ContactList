//
//  PersonsListViewController.swift
//  ContactList
//
//  Created by Денис Васильев on 21.12.2022.
//

import UIKit

class PersonsListViewController: UITableViewController {
    
    // MARK: - Public Properties
    var persons: [Person]!

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personListCell", for: indexPath)
        
        let person = persons[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = person.fullName
        cell.contentConfiguration = content
        
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let contactDetailVC = segue.destination as? ContactDetailViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        contactDetailVC.person = persons[indexPath.row]
    }
}
