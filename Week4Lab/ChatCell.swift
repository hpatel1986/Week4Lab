//
//  ChatCell.swift
//  Week4Lab
//
//  Created by Hiren Patel on 2/21/18.
//  Copyright © 2018 Hiren Patel. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {
    
    @IBOutlet weak var chatBoxLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
