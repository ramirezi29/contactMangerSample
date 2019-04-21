//
//  ContactTVCell.swift
//  ContactInporterSampleProj
//
//  Created by Ivan Ramirez on 4/18/19.
//  Copyright © 2019 ramcomw. All rights reserved.
//

import UIKit

class ContactTVCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    var contact: Contact? {
        didSet {
            layoutIfNeeded()
            updatesViews()
        }
    }
    
    func updatesViews() {
        
        guard let contact = contact else {
            print("☠️ contact is Nill☠️")
            return
        }
        nameLabel?.text = "\(contact.firstName) \(contact.lastName)"
        companyLabel?.text = contact.organizationName
        
        guard let myImage = contact.thumbnailImageData else {
            print("☠️Error getting image☠️")
            return
        }
        iconImageView.image = UIImage(data: myImage)
        iconImageView.layer.borderWidth = 1.0
        iconImageView.layer.masksToBounds = false
        iconImageView.layer.borderColor = UIColor.white.cgColor
        iconImageView.layer.cornerRadius = iconImageView.frame.size.width / 2
        iconImageView.clipsToBounds = true
        
    }
    
   
}
