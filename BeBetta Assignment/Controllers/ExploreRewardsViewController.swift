//
//  ExploreRewards.swift
//  BeBetta Assignment
//
//  Created by suhail on 26/01/24.
//

import UIKit

class ExploreRewardsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    override func viewWillAppear(_ animated: Bool) {
        self.presentationController?.containerView?.backgroundColor = AppColor.tintRewards.withAlphaComponent(0.7) //UIColor.black.withAlphaComponent(0.5)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.presentationController?.containerView?.backgroundColor = UIColor.clear
    }
    

    @IBAction func backTapped(_ sender: UIControl) {
        self.dismiss(animated: true)
    }
}
