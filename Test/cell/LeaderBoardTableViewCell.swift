//
//  TableViewTableViewCell.swift
//  Test
//
//  Created by Apple on 18/07/20.
//  Copyright © 2020 V group Inc. All rights reserved.
//

import UIKit
import SwiftChart

class LeaderBoardTableViewCell: UITableViewCell {

    @IBOutlet weak var companyImage: UIImageView!
    @IBOutlet weak var comapnyNameLabel: UILabel!
    @IBOutlet weak var totalSalesLabel: UILabel!
    @IBOutlet weak var curveView: UIView!
    @IBOutlet weak var dollarBtn: UIButton!
    @IBOutlet weak var cartBtn: UIButton!
    @IBOutlet weak var downloadBtn: UIButton!
    @IBOutlet weak var userBtn: UIButton!
    @IBOutlet weak var chartView: Chart!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        curveView.dropShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
