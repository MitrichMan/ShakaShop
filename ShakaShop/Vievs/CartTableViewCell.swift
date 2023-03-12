//
//  CartTableViewCell.swift
//  ShakaShop
//
//  Created by Dmitrii Melnikov on 11.03.2023.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet var productImageLabel: UIImageView!
    @IBOutlet var productNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
