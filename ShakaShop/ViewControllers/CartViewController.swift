//
//  CartViewController.swift
//  ShakaShop
//
//  Created by Dmitrii Melnikov on 11.03.2023.
//

import UIKit

class CartViewController: UIViewController {

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
        
        products = getProducts123()
        totalPrice = getFormattedTotalPrice(from: getTotalPrice())
        productsCount = getProductsCount()
        
        title = "Корзина"
        
        productsCountLabel.text = "\(productsCount)"
        totalPriceLabel.text = "\(totalPrice) руб"
        
        cartTableView.delegate = self
        cartTableView.dataSource = self
    }
    
    @IBAction func goToPaymentButtonTapped() {
    }
    
    @objc func removeFromCartButtonTapped(sender: UIButton) {
        products.remove(at: sender.tag)
        cartTableView.reloadData()
        productsCountLabel.text = "\(getProductsCount())"
        totalPriceLabel.text = "\(getFormattedTotalPrice(from: getTotalPrice())) руб"
    }
    
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
