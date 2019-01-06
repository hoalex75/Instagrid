//
//  instaView.swift
//  Instagrid
//
//  Created by Alex on 12/12/2018.
//  Copyright © 2018 Alexandre Holet. All rights reserved.
//

import UIKit

class InstaView: UIView {
    // MARK: Properties
    @IBOutlet var leftTopCornerImage : UIImageView!
    @IBOutlet var rightTopCornerImage : UIImageView!
    @IBOutlet var leftBottomCornerImage : UIImageView!
    @IBOutlet var rightBottomCornerImage : UIImageView!
    
    var style : Style = .numberThree {
        willSet {
            willStyle(style)
        }
        didSet{
            setStyle(style)
        }
    }
    
    // MARK: enum Style declaration
    enum Style{
        case numberOne, numberTwo, numberThree
    }
    
    // MARK: Functions
    // set the differents properties of instaView according to the style given in parameters
    private func setStyle(_ style : Style){
        switch style {
        case .numberOne:
            rightTopCornerImage.isHidden = true
            
            if self.bounds.width == 300 {
                leftTopCornerImage.frame = CGRect(x: leftTopCornerImage.frame.origin.x, y: leftTopCornerImage.frame.origin.y, width: 270, height: leftTopCornerImage.frame.height)
            } else {
                leftTopCornerImage.frame = CGRect(x: leftTopCornerImage.frame.origin.x, y: leftTopCornerImage.frame.origin.y, width: 260, height: leftTopCornerImage.frame.height)
            }
        
        case .numberTwo:
            rightBottomCornerImage.isHidden = true
            rightTopCornerImage.isHidden = false
            
            if self.bounds.width == 300 {
                leftBottomCornerImage.frame = CGRect(x: leftBottomCornerImage.frame.origin.x, y: leftBottomCornerImage.frame.origin.y, width: 270, height: leftBottomCornerImage.frame.height)
            } else {
                leftBottomCornerImage.frame = CGRect(x: leftBottomCornerImage.frame.origin.x, y: leftBottomCornerImage.frame.origin.y, width: 260, height: leftBottomCornerImage.frame.height)
            }
            
        case .numberThree:
            rightBottomCornerImage.isHidden = false
            rightTopCornerImage.isHidden = false
        
        
        }
    }
    
    // reset the changes before changing of style
    private func willStyle(_ style : Style){
        switch style {
        case .numberOne:
            leftTopCornerImage.frame = CGRect(x: leftTopCornerImage.frame.origin.x, y: leftTopCornerImage.frame.origin.y, width: leftTopCornerImage.frame.height, height: leftTopCornerImage.frame.height)
            rightTopCornerImage.isHidden = false
        case .numberTwo:
            leftBottomCornerImage.frame = CGRect(x: leftBottomCornerImage.frame.origin.x, y: leftBottomCornerImage.frame.origin.y, width: leftBottomCornerImage.frame.height, height: leftBottomCornerImage.frame.height)
            rightBottomCornerImage.isHidden = false
        default:
            rightTopCornerImage.isHidden = false
            rightBottomCornerImage.isHidden = false
        }
        
        
    }
    
    // return the instaView as an image
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }

   

}
