//
//  ContactDetailViewController.swift
//  ContactList
//
//  Created by Денис Васильев on 21.12.2022.
//

import UIKit

class ContactDetailViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var phoneNumberLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    // MARK: - Public Properties
    var person: Person!

    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = person.fullName
        phoneNumberLabel.text = person.phoneNumber
        emailLabel.text = person.email
    }
}
