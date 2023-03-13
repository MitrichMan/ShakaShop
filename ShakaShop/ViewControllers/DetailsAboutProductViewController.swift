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
    
    var product: Product!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = product.name
        settingsProduct()
    }
    
    @IBAction func imageButton(_ sender: Any) {
    }
    
    private func settingsProduct() {
        picturesImageView.image = UIImage(named: product.pictures.randomElement() ?? "")
        descriptionTextView.text = product.description
        featuresTextView.text = product.feature
        priceLabel.text = "\(getFormattedTotalPrice(from: product.price)) руб."
    }
    

}
// MARK: - GetPrice
extension DetailsAboutProductViewController {
    private func getFormattedTotalPrice(from totalPrice: Int) -> String {
        let priceAsNumber: NSNumber = totalPrice as NSNumber
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        formatter.decimalSeparator = ","
        
        return formatter.string(from:  priceAsNumber) ?? "0"
    }
}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


