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
    @IBOutlet var imageBotton: UIButton!
    var product: Product!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = product.name
        picturesImageView.image = UIImage(named: product.pictures[0])
        descriptionTextView.text = product.description
        featuresTextView.text = product.feature
        imageBotton.image = UIImage(named: product.pictures[1])
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
