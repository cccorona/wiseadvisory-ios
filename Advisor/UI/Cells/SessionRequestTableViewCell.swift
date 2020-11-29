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
    @IBOutlet private weak var nameLabel: UILabel?
    @IBOutlet private weak var dateLabel: UILabel?
    @IBOutlet private weak var descriptionLabel: UILabel?
    @IBOutlet private weak var tarifaLabel: UILabel?
    @IBOutlet private weak var hoursLabel: UILabel?
    @IBOutlet private weak var priceLabel: UILabel?
    @IBOutlet private weak var acceptButton: UIButton?
    @IBOutlet private weak var cancelButton: UIButton?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI(with session: NextSessionsResponse){
        profileImage?.makeCircle()
        nameLabel?.text = "\(session.question ?? "") Cliente: \(session.user_learning.fullname)"
        dateLabel?.text = session.date_parsed
        tarifaLabel?.text = session.user.tarifa
    }
    
}
