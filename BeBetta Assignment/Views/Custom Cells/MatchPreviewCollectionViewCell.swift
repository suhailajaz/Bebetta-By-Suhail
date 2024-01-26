//
//  MatchPreviewCollectionViewCell.swift
//  BeBetta Assignment
//
//  Created by suhail on 26/01/24.
//

import UIKit

class MatchPreviewCollectionViewCell: UICollectionViewCell {
    static let identifier = "MatchPreviewCollectionViewCell"
    static let nib = UINib(nibName: "MatchPreviewCollectionViewCell", bundle: nil)
    
    
    @IBOutlet var imgHighlight: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func configure(img: String){
        imgHighlight.image = UIImage(named: img)
    }
}
