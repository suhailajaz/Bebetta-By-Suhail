//
//  TimesButtons.swift
//  BeBetta Assignment
//
//  Created by suhail on 25/01/24.
//

import UIKit

class TimesButtons: UIView {
    @IBOutlet var vwBG: TimesButtons!
    
    @IBOutlet var vwContainer: UIView!
    @IBOutlet var btn1: UIControl!
    @IBOutlet var polygon1: UIImageView!
    @IBOutlet var polygon2: UIImageView!
    @IBOutlet var polygon3: UIImageView!
    @IBOutlet var polygon4: UIImageView!
    
    var previousSender = UIControl()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTimesButtonsView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupTimesButtonsView()
    }
    
    func setupTimesButtonsView() {
        if let view = Bundle.main.loadNibNamed("TimesButtons", owner: self)?.first as? UIView {
            view.frame = bounds
            addSubview(view)
           previousSender = btn1
            
        }
        
    }
    
    @IBAction func buttonsTapped(_ sender: UIControl) {
        DispatchQueue.main.async{
            self.previousSender.backgroundColor = UIColor.clear
            sender.layer.backgroundColor = AppColor.shadeButton.cgColor
            sender.layer.cornerRadius = 10
            sender.layer.masksToBounds = true
            
            switch sender.tag{
            case 1:
                self.polygon1.isHidden = false
               
                self.polygon2.isHidden = true
                self.polygon3.isHidden = true
                self.polygon4.isHidden = true
            case 2:
                self.polygon2.isHidden = false
                
                self.polygon1.isHidden = true
                self.polygon3.isHidden = true
                self.polygon4.isHidden = true
            case 3:
                self.polygon3.isHidden = false
                
                self.polygon1.isHidden = true
                self.polygon2.isHidden = true
                self.polygon4.isHidden = true
            default:
                self.polygon4.isHidden = false
             
                self.polygon1.isHidden = true
                self.polygon2.isHidden = true
                self.polygon3.isHidden = true
            }
            self.previousSender = sender
        }
      
        }
}
