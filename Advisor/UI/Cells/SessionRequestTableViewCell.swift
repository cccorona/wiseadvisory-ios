//
//  SessionRequestTableViewCell.swift
//  Advisor
//
//  Created by Luis Fernando Bustos Ramírez on 16/10/20.
//  Copyright © 2020 com.wise.advisor. All rights reserved.
//

import UIKit

class SessionRequestTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var profileImage: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI(){
        profileImage?.makeCircle()
    }
    
}
