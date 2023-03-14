//
//  CategoryTableViewCell.swift
//  ShakaShop
//
//  Created by Dmitrii Melnikov on 14.03.2023.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet var categoryImageView: UIImageView!
    @IBOutlet var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
