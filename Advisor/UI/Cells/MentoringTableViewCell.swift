//
//  MentoringTableViewCell.swift
//  Advisor
//
//  Created by Luis Fernando Bustos Ramírez on 23/09/20.
//  Copyright © 2020 com.wise.advisor. All rights reserved.
//

import UIKit

class MentoringTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var profileImage: UIImageView?
    @IBOutlet private weak var likeButton: UIButton?
    @IBOutlet private weak var chatButton: UIButton?
    @IBOutlet private weak var mentoryButton: UIButton?
    @IBOutlet private weak var nameLabel: UILabel?
    @IBOutlet private weak var timeLabel: UILabel?
    @IBOutlet private weak var previewImage: UIImageView?
    @IBOutlet private weak var playButton: UIButton?
    @IBOutlet private weak var titleLabel: UILabel?
    @IBOutlet private weak var detailLabel: UILabel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func setupWith(mentory: Mentory){
        
    }
    
    
    func setupUI(){
        profileImage?.makeCircle()
        likeButton?.makeCircle()
        chatButton?.makeCircle()
        mentoryButton?.makeCircle()
        playButton?.makeCircle()
    }
    
}
