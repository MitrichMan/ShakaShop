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
        nameLabel.text = customerDetails["name"]
        surnameLabel.text = customerDetails["surname"]
        phoneLabel.text = customerDetails["phone"]
        emailLabel.text = customerDetails["email"]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
