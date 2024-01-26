//
//  MostHappeningCollectionViewCell.swift
//  BeBetta Assignment
//
//  Created by suhail on 25/01/24.
//

import UIKit

class MostHappeningCollectionViewCell: UICollectionViewCell {

    static let identifier = "MostHappeningCollectionViewCell"
    static let nib = UINib(nibName: "MostHappeningCollectionViewCell", bundle: nil)
    
    @IBOutlet var vwBorder: UIView!
    @IBOutlet var imgTeam: UIImageView!
    @IBOutlet var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
      
        imgTeam.layer.cornerRadius = imgTeam.frame.width/2
        imgTeam.layer.masksToBounds = true
        imgTeam.layer.borderWidth = 4
        imgTeam.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func configure(img: String,name: String){
        //imgTeam.image = UIImage(named: img)
        imgTeam.image = UIImage(named: "real")
        lblName.text = "R. Madrid"
    }

}
