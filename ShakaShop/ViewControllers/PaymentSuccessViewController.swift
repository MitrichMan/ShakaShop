//
//  PaymentSuccessViewController.swift
//  ShakaShop
//
//  Created by Dmitrii Melnikov on 12.03.2023.
//

import UIKit

class PaymentSuccessViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var customerDetails: [String: String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true

        nameLabel.text = customerDetails["name"]
        surnameLabel.text = customerDetails["surname"]
        phoneLabel.text = customerDetails["phone"]
        emailLabel.text = customerDetails["email"]
    }
    
    @IBAction func goShoppingButtonTapped() {
        guard let shopVC = tabBarController as? ShopTabBarViewController else { return }
        shopVC.removeAllProducts()
        navigationController?.popToRootViewController(animated: true)
    }
}
