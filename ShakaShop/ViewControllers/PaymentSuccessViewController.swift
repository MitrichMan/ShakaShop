//
//  PaymentSuccessViewController.swift
//  ShakaShop
//
//  Created by Dmitrii Melnikov on 12.03.2023.
//

import UIKit

class PaymentSuccessViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    var customerDetails: [String: String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true

        nameLabel.text = customerDetails["name"]
        surnameLabel.text = customerDetails["surname"]
        phoneLabel.text = customerDetails["phone"]
        emailLabel.text = customerDetails["email"]
    }
    
    deinit {
        print("kkhjkj")
        print("kkhjkj")
        print("kkhjkj")
        print("kkhjkj")
        print("kkhjkj")
        print("kkhjkj")
        print("kkhjkj")
        print("kkhjkj")

    }
    
    @IBAction func goShoppingButtonTapped() {
        dismiss(animated: true)
        performSegue(withIdentifier: "goToShopping", sender: nil)
    }
}
