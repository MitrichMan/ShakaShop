//
//  CartViewController.swift
//  ShakaShop
//
//  Created by Dmitrii Melnikov on 11.03.2023.
//

import UIKit

class CartViewController: UIViewController, UITableViewDelegate {

    @IBOutlet var cartTableView: UITableView!
    
    @IBOutlet var productsCountLabel: UILabel!
    @IBOutlet var totalPriceLabel: UILabel!
    
    @IBOutlet var goToPaymentButton: UIButton!
    
    let categories = Category.getCategories()
    var products: [Product] = []
    var totalPrice = "0"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        products = getProducts123()
        totalPrice = getFormattedTotalPrice(from: getTotalPrice())
        
        title = "Корзина"
        
        productsCountLabel.text = "\(products.count)"
        totalPriceLabel.text = "\(totalPrice) руб"
        
        cartTableView.delegate = self
        cartTableView.dataSource = self
    }
    
    @IBAction func goToPaymentButtonTapped() {
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

extension CartViewController {

}

//MARK: - UITableViewDataSource
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
