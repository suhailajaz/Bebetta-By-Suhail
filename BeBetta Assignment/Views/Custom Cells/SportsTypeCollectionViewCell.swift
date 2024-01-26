//
//  SportsTypeCollectionViewCell.swift
//  BeBetta Assignment
//
//  Created by suhail on 25/01/24.
//

import UIKit

class SportsTypeCollectionViewCell: UICollectionViewCell {
    static let identifier = "SportsTypeCollectionViewCell"
    static let nib = UINib(nibName: "SportsTypeCollectionViewCell", bundle: nil)
    
    @IBOutlet var vwContainer: UIView!
    @IBOutlet var imgIcon: UIImageView!
    @IBOutlet var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        vwContainer.layer.cornerRadius = 17
        vwContainer.layer.masksToBounds = true
    }
    
    func configure(color: String,icon: String,name: String){
        self.vwContainer.backgroundColor = UIColor().named(color)
        self.imgIcon.image = UIImage(named: icon)
        self.lblName.text = name

        
    }

}
