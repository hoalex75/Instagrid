//
//  instaView.swift
//  Instagrid
//
//  Created by Alex on 12/12/2018.
//  Copyright © 2018 Alexandre Holet. All rights reserved.
//

import UIKit

class InstaView: UIView {

    @IBOutlet var leftTopCornerImage : UIImageView!
    @IBOutlet var rightTopCornerImage : UIImageView!
    @IBOutlet var leftBottomCornerImage : UIImageView!
    @IBOutlet var rightBottomCornerImage : UIImageView!
    
    
    enum Style{
        case numberOne, numberTwo, numberThree
    }
    
    var style : Style = .numberOne {
        willSet {
            willStyle(style)
        }
        didSet{
            setStyle(style)
        }
    }
    
    private func setStyle(_ style : Style){
        switch style {
        case .numberOne:
            rightTopCornerImage.isHidden = true
            
            if self.bounds.width == 300 {
                leftTopCornerImage.frame = CGRect(x: leftTopCornerImage.frame.origin.x, y: leftTopCornerImage.frame.origin.y, width: 270, height: leftTopCornerImage.frame.height)
                leftTopCornerImage.image = UIImage(named: "noImageWide")
            } else {
                leftTopCornerImage.frame = CGRect(x: leftTopCornerImage.frame.origin.x, y: leftTopCornerImage.frame.origin.y, width: 260, height: leftTopCornerImage.frame.height)
                leftTopCornerImage.image = UIImage(named: "noImageWide")
            }
        
        case .numberTwo:
            rightBottomCornerImage.isHidden = true
            rightTopCornerImage.isHidden = false
            
            if self.bounds.width == 300 {
                leftBottomCornerImage.frame = CGRect(x: leftBottomCornerImage.frame.origin.x, y: leftBottomCornerImage.frame.origin.y, width: 270, height: leftBottomCornerImage.frame.height)
                leftBottomCornerImage.image = UIImage(named: "noImageWide")
            } else {
                leftBottomCornerImage.frame = CGRect(x: leftBottomCornerImage.frame.origin.x, y: leftBottomCornerImage.frame.origin.y, width: 260, height: leftBottomCornerImage.frame.height)
                leftBottomCornerImage.image = UIImage(named: "noImageWide")
            }
            
        case .numberThree:
            rightBottomCornerImage.isHidden = false
            rightTopCornerImage.isHidden = false
        
        
        }
    }
    
    private func willStyle(_ style : Style){
        switch style {
        case .numberOne:
            leftTopCornerImage.frame = CGRect(x: leftTopCornerImage.frame.origin.x, y: leftTopCornerImage.frame.origin.y, width: leftTopCornerImage.frame.height, height: leftTopCornerImage.frame.height)
            leftTopCornerImage.image = UIImage(named: "emptySpot")
            rightTopCornerImage.isHidden = false
        case .numberTwo:
            leftBottomCornerImage.frame = CGRect(x: leftBottomCornerImage.frame.origin.x, y: leftBottomCornerImage.frame.origin.y, width: leftBottomCornerImage.frame.height, height: leftBottomCornerImage.frame.height)
            leftBottomCornerImage.image = UIImage(named: "emptySpot")
            rightBottomCornerImage.isHidden = false
        default:
            rightTopCornerImage.isHidden = false
            rightBottomCornerImage.isHidden = false
        }
        
        
    }
    
    func setLeftTopCornerImage(_ img : UIImage){
        leftTopCornerImage.image = img
    }
    

    
   

}
