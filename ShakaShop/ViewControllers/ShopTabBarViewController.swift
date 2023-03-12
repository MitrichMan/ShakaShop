//
//  TabBarViewController.swift
//  ShakaShop
//
//  Created by Дмитрий Лубов on 11.03.2023.
//

import UIKit

class ShopTabBarViewController: UITabBarController {
    
    var products: [Product] = [] {
        didSet {
            getProducts()
        }
    }
    
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
    
    func getProducts() {
        guard let viewControllers = viewControllers else { return }
        
        viewControllers.forEach { viewController in
            if let navigation = viewController as? UINavigationController {
                let cartVC = navigation.topViewController as? CartViewController
                guard let cartVC else { return }
                cartVC.products = products
            }
        }
    }
    
    func add(product: Product) {
        products.append(product)
    }

}
