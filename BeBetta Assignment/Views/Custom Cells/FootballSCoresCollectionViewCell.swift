//
//  FootballSCoresCollectionViewCell.swift
//  BeBetta Assignment
//
//  Created by suhail on 25/01/24.
//

import UIKit

class FootballSCoresCollectionViewCell: UICollectionViewCell {
   
    static let identifier = "FootballSCoresCollectionViewCell"
    static let nib = UINib(nibName: "FootballSCoresCollectionViewCell", bundle: nil)
    
    @IBOutlet var firstTeamName: UILabel!
    @IBOutlet var secondTeamName: UILabel!
    @IBOutlet var vwContainer: UIView!
    @IBOutlet var imgTeam1: UIImageView!
    @IBOutlet var imgTeam2: UIImageView!
    @IBOutlet var lblScoreTeam1: UILabel!
    @IBOutlet var lblSCoreTeam2: UILabel!
    @IBOutlet var lblMinutes: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        vwContainer.layer.cornerRadius = 10
        vwContainer.layer.masksToBounds = true
        vwContainer.layer.borderWidth = 0.7
        vwContainer.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func configure(team1Name: String, team2Name: String, icon1: String,icon2:String,score1: String,score2: String,minutes: String){
        imgTeam1.image = UIImage(named: icon1)
        imgTeam2.image = UIImage(named: icon2)
        firstTeamName.text = team1Name
        secondTeamName.text = team2Name
        lblScoreTeam1.text = score1
        lblSCoreTeam2.text = score2
        lblMinutes.text = minutes
    }

}
