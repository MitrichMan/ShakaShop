//
//  ProductsListViewController.swift
//  ShakaShop
//
//  Created by Артём Латушкин on 11.03.2023.
//

import UIKit

final class ProductsListViewController: UITableViewController {
    
    var products: [Product] = []
    var category: Category!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = category.name
    }
    
    @objc func addToCartButtonTapped(sender: UIButton) {
        showAlert(title: "Внимание", message: "Товар \(products[sender.tag].name) добавлен в корзину")
        guard let shopTabBarVC = tabBarController as? ShopTabBarViewController else { return }
        shopTabBarVC.add(product: products[sender.tag])
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellProduct") as! CustomCellTableViewCell
        let product = products[indexPath.row]
        let addToCartButton = UIButton()
        addToCartButton.tag = indexPath.row
        addToCartButton.addTarget(
            self,
            action: #selector(ProductsListViewController.addToCartButtonTapped),
            for: .touchUpInside
        )
        addToCartButton.setImage(UIImage(systemName: "cart.badge.plus"), for: .normal)
        addToCartButton.frame = CGRect(x: 0, y: 0, width: 45, height: 45)
        
        cell.nameLabel.text = product.name
        cell.pictureImageView.image = UIImage(named: product.pictures[0])
        cell.accessoryView = addToCartButton
        
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
        80
    }
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


