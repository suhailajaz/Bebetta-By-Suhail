//
//  ViewController.swift
//  BeBetta Assignment
//
//  Created by suhail on 25/01/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var vwTiimes: UIView!
    @IBOutlet var vwCardGreen: UIView!
    @IBOutlet var vwCardOrange: UIView!
    @IBOutlet var vwCardBlue: UIView!
    @IBOutlet var vwBettaCoins: UIView!
    @IBOutlet var vwLive: UIView!
   
    @IBOutlet var colSportType: UICollectionView!{
        didSet{
            colSportType.register(SportsTypeCollectionViewCell.nib, forCellWithReuseIdentifier: SportsTypeCollectionViewCell.identifier)
        }
    }
    @IBOutlet var colFootballSCores: UICollectionView!{
        didSet{
            colFootballSCores.register(FootballSCoresCollectionViewCell.nib, forCellWithReuseIdentifier: FootballSCoresCollectionViewCell.identifier)
        }
    }
    @IBOutlet var colMostHappening: UICollectionView!{
        didSet{
            colMostHappening.register(MostHappeningCollectionViewCell.nib, forCellWithReuseIdentifier: MostHappeningCollectionViewCell.identifier)
        }
    }
    @IBOutlet var colMatchPreview: UICollectionView!{
        didSet{
            colMatchPreview.register(MatchPreviewCollectionViewCell.nib, forCellWithReuseIdentifier: MatchPreviewCollectionViewCell.identifier)
        }
    }
    
    var teams = [TeamsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDelegates()
        giveBordersAndCornerRadius()
        vwCardBlue.setTransformRotation(toDegrees: -5)
        vwCardOrange.setTransformRotation(toDegrees: 4)
        
        DataManager.shared.readJSONFile { data in
            self.teams = data
        }
        
    }
    
    
    
    ///Presents the explore rewrds screen
    @IBAction func btnExploreReawrdsTapped(_ sender: UIControl) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "exploreRewards") as! ExploreRewardsViewController
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        
        DispatchQueue.main.async(){ [weak self] in
            self?.present(vc, animated: true)
        }
    }
    
    
}
// MARK: - SportsType COllection View Delegate Methods
extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        teams.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == colSportType {
            
            let item = teams[indexPath.row]
            let cell = colSportType.dequeueReusableCell(withReuseIdentifier: SportsTypeCollectionViewCell.identifier, for: indexPath) as! SportsTypeCollectionViewCell
            cell.configure(color: item.color, icon: item.sport_icon, name: item.sport_name)
            return cell
            
        }else if collectionView == colFootballSCores{
            
            let item = teams[indexPath.row]
            let cell = colFootballSCores.dequeueReusableCell(withReuseIdentifier: FootballSCoresCollectionViewCell.identifier, for: indexPath) as! FootballSCoresCollectionViewCell
            cell.configure(team1Name: item.first_team, team2Name: item.second_team, icon1: item.first_team_icon, icon2: item.second_team_icon, score1: item.score_team_1, score2: item.score_team_2, minutes: item.minutes)
            return cell
            
        }else if collectionView == colMostHappening{
            
            let item = teams[indexPath.row]
            let cell = colMostHappening.dequeueReusableCell(withReuseIdentifier: MostHappeningCollectionViewCell.identifier, for: indexPath) as! MostHappeningCollectionViewCell
            cell.configure(img: item.second_team_icon, name: item.second_team)
            return cell
            
        }else{
            
            let item = teams[indexPath.row]
            let cell = colMatchPreview.dequeueReusableCell(withReuseIdentifier: MatchPreviewCollectionViewCell.identifier, for: indexPath) as! MatchPreviewCollectionViewCell
            cell.configure(img: item.highlight_image)
            return cell
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == colSportType {
            return CGSize(width: 105, height: 34)
        }else if collectionView == colFootballSCores{
            return CGSize(width: 172, height: 150)
        }else if collectionView == colMostHappening{
            return CGSize(width: 55, height: 82)
        }else{
            return CGSize(width: 250, height: 150)
        }
        
    }
    
}

// MARK: - Custom Methods
extension HomeViewController{
    
    ///setus up the delegates and the datasources
    func setupDelegates(){
        colSportType.delegate = self
        colSportType.dataSource = self
        colFootballSCores.dataSource = self
        colSportType.dataSource = self
        colMostHappening.delegate = self
        colMostHappening.dataSource = self
        colMatchPreview.dataSource = self
        colMatchPreview.delegate = self
    }
    
    ///gives boredrs and corner radius to  requiredviews
    func giveBordersAndCornerRadius(){
        colSportType.showsHorizontalScrollIndicator = false
        vwLive.layer.cornerRadius = 6
        vwLive.layer.masksToBounds = true
        vwBettaCoins.layer.cornerRadius = 8
        vwBettaCoins.layer.masksToBounds = true
        vwCardBlue.layer.cornerRadius = 8
        vwCardBlue.layer.masksToBounds = true
        vwCardOrange.layer.cornerRadius = 8
        vwCardOrange.layer.masksToBounds = true
        vwCardGreen.layer.cornerRadius = 8
        vwCardGreen.layer.masksToBounds = true
        
    }
    
}
