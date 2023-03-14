//
//  CategoryListViewController.swift
//  ShakaShop
//
//  Created by Дмитрий Лубов on 11.03.2023.
//

import UIKit

class CategoryListViewController: UITableViewController {

    var categories: [Category] = []
    
    var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Категории"
        
        let image = UIImage(systemName: "book.fill")
        tabBarItem = UITabBarItem(title: "Товары", image: image, tag: 1)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let productListVC = segue.destination as? ProductsListViewController
        
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        productListVC?.products = categories[indexPath.row].products
        productListVC?.category = categories[indexPath.row]
    }
}

// MARK: TableViewDataSource
extension CategoryListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryRow", for: indexPath) as! CategoryTableViewCell
//        let content = cell.defaultContentConfiguration()
        
        cell.categoryImageView.image = UIImage(named: categories[indexPath.row].name)
        cell.categoryLabel.text = categories[indexPath.row].name
//        cell.contentConfiguration = content
        
        return cell
    }
}
