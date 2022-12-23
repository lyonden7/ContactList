//
//  TabBarController.swift
//  ContactList
//
//  Created by Денис Васильев on 22.12.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    // MARK: - Private Properties
    private let persons = Person.getPersons()
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBarAppearance()
        setupViewControllers()
    }
}

// MARK: - Private Methods
extension TabBarController {
    private func setupTabBarAppearance() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
    }
    
    private func setupViewControllers() {
        guard let tabBarController = viewControllers else { return }
        
        tabBarController.forEach { viewController in
            guard let navigationController = viewController as? UINavigationController else { return }
            
            if let personsListVC = navigationController.topViewController as? PersonsListViewController {
                personsListVC.persons = persons
            } else if let listDetailVC = navigationController.topViewController as? ListDetailViewController {
                listDetailVC.persons = persons
            }
        }
    }
}
