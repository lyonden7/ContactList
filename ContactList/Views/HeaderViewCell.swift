//
//  HeaderViewCell.swift
//  ContactList
//
//  Created by Денис Васильев on 23.12.2022.
//

import UIKit

class HeaderViewCell: UITableViewCell {

    // MARK: - IB Outlets
    @IBOutlet var personImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    
    // MARK: - IB Actions
    @IBAction func phoneButtonPressed() {
        print("Phone button pressed")
    }
}
