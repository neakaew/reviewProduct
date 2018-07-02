//
//  ProductTableViewCell.swift
//  ReviewProdductsApp
//
//  Created by udom on 2/7/61.
//  Copyright © พ.ศ. 2561 ReviewProducts. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productNameInTableView: UILabel!
    @IBOutlet weak var detailProductInTableView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
