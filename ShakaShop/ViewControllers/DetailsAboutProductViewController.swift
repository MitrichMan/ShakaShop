//
//  DetailsAboutProductViewController.swift
//  ShakaShop
//
//  Created by Артём Латушкин on 11.03.2023.
//

import UIKit

class DetailsAboutProductViewController: UIViewController {
    
    @IBOutlet var picturesImageView: UIImageView!
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var featuresTextView: UITextView!
    var product: Product!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = product.name
        picturesImageView.image = UIImage(named: product.pictures.randomElement() ?? "")
        descriptionTextView.text = product.description
        featuresTextView.text = product.feature
    }
    @IBAction func imageButton(_ sender: Any) {
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
