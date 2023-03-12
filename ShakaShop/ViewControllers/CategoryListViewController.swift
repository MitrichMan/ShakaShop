//
//  CategoryListViewController.swift
//  ShakaShop
//
//  Created by Дмитрий Лубов on 11.03.2023.
//

import UIKit

class CategoryListViewController: UITableViewController {

    var categories: [Category] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Category"
        
        let image = UIImage(systemName: "book.fill")
        tabBarItem = UITabBarItem(title: "Products", image: image, tag: 1)
    }
}

// MARK: TableViewDataSource
extension CategoryListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryRow", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.text = categories[indexPath.row].name
        cell.contentConfiguration = content
        
        return cell
    }
}

// MARK: TableViewDelegate
extension CategoryListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
