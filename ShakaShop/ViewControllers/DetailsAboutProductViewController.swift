//
//  DetailsAboutProductViewController.swift
//  ShakaShop
//
//  Created by Артём Латушкин on 11.03.2023.
//

import UIKit

final class DetailsAboutProductViewController: UIViewController {
    
    @IBOutlet var picturesImageView: UIImageView!
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var featuresTextView: UITextView!
    @IBOutlet var actionButton: UIButton!
    
    var product: Product!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = product.name
        settingsProduct()
        actionButton.setTitle("В корзину", for: .normal)
        
    }
    
    @IBAction func imageButton(_ sender: Any) {
        actionButton.setTitle("В корзине", for: .normal)
        showAlert(title: "Внимание", message: "Товар \(product.name) добавлен в корзину")
        guard let shopTabBarVC = tabBarController as? ShopTabBarViewController else { return }
        shopTabBarVC.add(product: product)
    }
    
    private func settingsProduct() {
        picturesImageView.image = UIImage(named: product.pictures.randomElement() ?? "")
        descriptionTextView.text = product.description
        featuresTextView.text = product.feature
        priceLabel.text = "\(getFormattedTotalPrice(from: product.price)) руб."
    }
}

extension DetailsAboutProductViewController {
    private func getFormattedTotalPrice(from totalPrice: Int) -> String {
        let priceAsNumber: NSNumber = totalPrice as NSNumber
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        formatter.decimalSeparator = ","
        
        return formatter.string(from:  priceAsNumber) ?? "0"
    }
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

