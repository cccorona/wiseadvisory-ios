//
//  GeneralTableViewCell.swift
//  Advisor
//
//  Created by Luis Fernando Bustos Ramírez on 30/11/20.
//  Copyright © 2020 com.wise.advisor. All rights reserved.
//

import UIKit

class GeneralTableViewCell: UITableViewCell {
    
    @IBOutlet var title: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
