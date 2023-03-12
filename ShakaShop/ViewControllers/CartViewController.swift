//
//  CartViewController.swift
//  ShakaShop
//
//  Created by Dmitrii Melnikov on 11.03.2023.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet var cartTableView: UITableView!
    let categories = Category.getCategories()
    var products: [Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        products = getProducts123()
        print(products.count)
        cartTableView.delegate = self
        cartTableView.dataSource = self
    }
}

extension CartViewController: UITableViewDelegate {

}

extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductInCart", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let product = products[indexPath.row]
        
        content.text = product.name
//        content.image = UIImage(named: product.pictures[0])
        cell.contentConfiguration = content
        
        return cell
    }
    
    
}

// MARK: - Temporary
extension CartViewController {
    func getProducts123() -> [Product] {
        var products: [Product] = []
        for category in categories {
            if category.name == "Доски для серфинга" {
                products = category.products
            }
        }
        return products
    }
}
