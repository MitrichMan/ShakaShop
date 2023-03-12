//
//  PaymentDetailsViewController.swift
//  ShakaShop
//
//  Created by Dmitrii Melnikov on 12.03.2023.
//

import UIKit

class PaymentDetailsViewController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var surnameTextField: UITextField!
    @IBOutlet var phoneTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? PaymentSuccessViewController else {
            return
        }
        destinationVC.customerDetails = getCustomerDetails()
    }
    
    @IBAction func sendDetailsButtonTapped() {
    }
}

extension PaymentDetailsViewController {
    private func getCustomerDetails() -> [String: String] {
        var customerDetails: [String: String] = [:]
        customerDetails["name"] = nameTextField.text
        customerDetails["surname"] = surnameTextField.text
        customerDetails["phone"] = phoneTextField.text
        customerDetails["email"] = emailTextField.text
        return customerDetails
    }
}

extension PaymentDetailsViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            surnameTextField.becomeFirstResponder()
        } else if textField == surnameTextField {
            phoneTextField.becomeFirstResponder()
        } else if textField == phoneTextField {
            emailTextField.becomeFirstResponder()
        } else {
            performSegue(withIdentifier: "goToSuccess", sender: nil)
        }
        return true
    }
}
