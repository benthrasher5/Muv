//
//  TopTableViewCell.swift
//  Muv
//
//  Created by Ben Thrasher on 4/18/17.
//  Copyright © 2017 Ben Thrasher. All rights reserved.
//

import UIKit

class TopTableViewCell: UITableViewCell {
    
    //MARK: Interface objects
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var peopleCountLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
