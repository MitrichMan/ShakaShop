//
//  aboutViewController.swift
//  ShakaShop
//
//  Created by Артём Латушкин on 14.03.2023.
//

import UIKit

class AboutViewController: UIViewController {
    @IBOutlet var firstAuthor: UIImageView! {
        didSet {
            firstAuthor.layer.cornerRadius = firstAuthor.frame.height / 2
        }
    }
    @IBOutlet var thirdAuthor: UIImageView! {
        didSet {
            thirdAuthor.layer.cornerRadius = thirdAuthor.frame.height / 2
        }
    }
    @IBOutlet var secondAuthor: UIImageView!{
        didSet {
            secondAuthor.layer.cornerRadius = secondAuthor.frame.height / 2
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Авторы"
        
        let image = UIImage(systemName: "person.fill")
        tabBarItem = UITabBarItem(title: "Авторы", image: image, tag: 1)

        
    }
}
