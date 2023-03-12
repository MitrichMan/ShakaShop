//
//  TabBarViewController.swift
//  ShakaShop
//
//  Created by Дмитрий Лубов on 11.03.2023.
//

import UIKit

class ShopTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        getCategory()
    }
    
    func getCategory() {
        guard let navigation = viewControllers?.first as? UINavigationController
            else { return }
        guard let categoryVC = navigation.topViewController as? CategoryListViewController
            else { return }
       
        categoryVC.categories = Category.getCategories()
    }

}
