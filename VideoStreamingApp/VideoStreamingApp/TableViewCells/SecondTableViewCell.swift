//
//  SecondTableViewCell.swift
//  VideoStreamingApp
//
//  Created by Bridge on 30/08/23.
//

import UIKit

class SecondTableViewCell: UITableViewCell {

    @IBOutlet weak var secondTitle: UILabel!
    
    
    @IBOutlet weak var secondTags: UILabel!
    
    
    @IBOutlet weak var secondViews: UILabel!
    
    @IBOutlet weak var secondDate: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
