//
//  DataContainers.swift
//  BeBetta Assignment
//
//  Created by suhail on 25/01/24.
//

import Foundation
import UIKit


// MARK: - <#Type the section heading#>
struct AppColor {
    
    static let shadeButton =  hexStringToUIColor(hex: "#5DAE75")
    static let tintRewards = hexStringToUIColor(hex: "282828")
}

extension UIView {
    func setTransformRotation(toDegrees angleInDegrees: CGFloat) {
        let angleInRadians = angleInDegrees / 180.0 * CGFloat.pi
        let rotation = self.transform.rotated(by: angleInRadians)
        self.transform = rotation
    }
    static func loadFromNib() -> Self {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: String(describing: self), bundle: bundle)
        return nib.instantiate(withOwner: nil, options: nil).first as! Self
    }
    @IBInspectable var cornerRadiusV: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidthV: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColorV: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
}


// MARK: - UICOLOR Extensions
extension UIColor {
    public func named(_ name: String) -> UIColor? {
        let allColors: [String: UIColor] = [
            "red": .red,
            "white": .white,
            "black": .black,
            "green": .green,
            "yellow": .yellow,
            "purple": .purple
        ]
        let cleanedName = name.replacingOccurrences(of: " ", with: "").lowercased()
        return allColors[cleanedName]
    }
}

// MARK: - Global Functions
func hexStringToUIColor (hex:String, alpha: CGFloat = 1.0) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(alpha)
    )
}

// MARK: -  HardCorded Test data, Removed after adding JSON
struct DataContainers{
    static let shared = DataContainers()
    init(){}

    let colSportsTypeDatasource = [[UIColor.white,"football","Football"],[UIColor.black,"cricket","Cricket"],[UIColor.green,"basketball","BasketBall"],[UIColor.purple,"tennis","Tennis"],[UIColor.red,"addingSoon","Adding Soon"],[UIColor.white,"football","Football"],[UIColor.black,"cricket","Cricket"],[UIColor.green,"basketball","BasketBall"],[UIColor.purple,"tennis","Tennis"],[UIColor.red,"addingSoon","Adding Soon"]]

}
