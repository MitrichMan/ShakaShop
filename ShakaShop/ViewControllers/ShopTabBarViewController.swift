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
            print("getProducts")
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
        guard let navigation = viewControllers?.first as? UINavigationController
            else { return }
        guard let categoryVC = navigation.topViewController as? CategoryListViewController
            else { return }
        
        categoryVC.products = products
    }
    
    func add(product: Product) {
        products.append(product)
    }

}
