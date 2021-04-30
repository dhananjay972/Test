//
//  SortByTableViewCell.swift
//  Test
//
//  Created by Apple on 18/07/20.
//  Copyright © 2020 V group Inc. All rights reserved.
//

import UIKit

class SortByTableViewCell: UITableViewCell {
    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
