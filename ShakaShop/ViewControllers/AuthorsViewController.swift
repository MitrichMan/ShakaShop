//
//  AuthorsViewController.swift
//  ShakaShop
//
//  Created by Dmitrii Melnikov on 14.03.2023.
//

import UIKit

class AuthorsViewController: UIViewController {

    @IBOutlet var firstAuthorImageView: UIImageView!  {
        didSet {
            firstAuthorImageView.layer.cornerRadius = firstAuthorImageView.frame.height / 2
        }
    }
    @IBOutlet var secondAuthorImageView: UIImageView! {
        didSet {
            secondAuthorImageView.layer.cornerRadius = secondAuthorImageView.frame.height / 2
        }
    }
    @IBOutlet var thirdAuthorImageView: UIImageView! {
        didSet {
            thirdAuthorImageView.layer.cornerRadius = thirdAuthorImageView.frame.height / 2
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Авторы"

    }
    
    func setupAuthors() {
        tabBarItem = UITabBarItem(title: "Авторы", image: UIImage(systemName: "person.fill"), tag: 1)
    }
}
