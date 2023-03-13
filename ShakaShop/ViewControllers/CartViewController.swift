//
//  CartViewController.swift
//  ShakaShop
//
//  Created by Dmitrii Melnikov on 11.03.2023.
//

import UIKit

final class CartViewController: UIViewController {

    @IBOutlet var cartTableView: UITableView!
    
    @IBOutlet var productsCountLabel: UILabel!
    @IBOutlet var totalPriceLabel: UILabel!
    
    @IBOutlet var goToPaymentButton: UIButton!
        
    let categories = Category.getCategories()
    var products: [Product] = []
    var totalPrice = "0"
    var productsCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalPrice = getFormattedTotalPrice(from: getTotalPrice())
        productsCount = getProductsCount()
        
        productsCountLabel.text = "\(productsCount)"
        totalPriceLabel.text = "\(totalPrice) руб"
        
        cartTableView.delegate = self
        cartTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let shopVC = tabBarController as? ShopTabBarViewController else { return }
        products = shopVC.products
        cartTableView.reloadData()
        productsCountLabel.text = "\(getProductsCount())"
        totalPriceLabel.text = "\(getFormattedTotalPrice(from: getTotalPrice())) руб"
    }
    
    
//MARK: - @IBActions
    @IBAction func clearCartButtonTapped() {
        products = []
        cartTableView.reloadData()
        productsCountLabel.text = "\(getProductsCount())"
        totalPriceLabel.text = "\(getFormattedTotalPrice(from: getTotalPrice())) руб"
    }
    
    @IBAction func goToPaymentButtonTapped() {
        if products.count == 0 {
            showAlert(title: "Упс!", message: "Ваша корзина пуста")
            return
        }
    }
    
    @objc func removeFromCartButtonTapped(sender: UIButton) {
        guard let shopVC = tabBarController as? ShopTabBarViewController else { return }
        shopVC.removeProduct(at: sender.tag)
        cartTableView.reloadData()
        productsCountLabel.text = "\(getProductsCount())"
        totalPriceLabel.text = "\(getFormattedTotalPrice(from: getTotalPrice())) руб"
    }
}

//MARK: - UITableViewDelegate
extension CartViewController: UITableViewDelegate {
}

//MARK: - UITableViewDataSource
extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductInCart") as! CartTableViewCell
        let product = products[indexPath.row]
        let removeFromCartButton = UIButton()
        removeFromCartButton.tag = indexPath.row
        removeFromCartButton.addTarget(
            self,
            action: #selector(CartViewController.removeFromCartButtonTapped),
            for: .touchUpInside
        )
        removeFromCartButton.setImage(UIImage(systemName: "cart.badge.minus"), for: .normal)
        removeFromCartButton.frame = CGRect(x: 0, y: 0, width: 45, height: 45)
        
        cell.productNameLabel.text = product.name
        cell.productImageView.image = UIImage(named: product.pictures[0])
        cell.accessoryView = removeFromCartButton
        
        return cell
    }
}

//MARK: - Alert
extension CartViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - CartViewController
extension CartViewController {
    private func getProductsCount() -> Int {
        products.count
    }
    
    private func getTotalPrice() -> Int {
        var totalPrice = 0
        
        for product in products {
            totalPrice += product.price
        }
        return totalPrice
    }
    
    private func getFormattedTotalPrice(from totalPrice: Int) -> String {
        let priceAsNumber: NSNumber = totalPrice as NSNumber
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        formatter.decimalSeparator = ","
        
        return formatter.string(from:  priceAsNumber) ?? "0"
    }
}
