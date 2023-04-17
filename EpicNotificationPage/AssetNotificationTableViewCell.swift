//
//  AssetNotificationTableViewCell.swift
//  EpicNotificationPage
//
//  Created by R.Unnikrishnan on 13/04/23.
//

import UIKit

class AssetNotificationTableViewCell: UITableViewCell {

    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var notificationLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        statusView.layer.cornerRadius = statusView.frame.width / 2
        statusView.layer.masksToBounds = true
        
        notificationLabel.sizeToFit()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
