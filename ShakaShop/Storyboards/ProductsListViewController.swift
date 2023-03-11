//
//  ProductsListViewController.swift
//  ShakaShop
//
//  Created by Артём Латушкин on 11.03.2023.
//

import UIKit

final class ProductsListViewController: UITableViewController {
    
    var products = Product.getProducts()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellProduct", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let product = products[indexPath.row]
        
        content.text = product.name
        content.image = UIImage(named: product.pictures[0])
        cell.contentConfiguration = content
        
        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            guard let detailsAboutProductVC = segue.destination as? DetailsAboutProductViewController else { return }
            detailsAboutProductVC.product = products[indexPath.row]
        }
    }
}

extension ProductsListViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    
}
