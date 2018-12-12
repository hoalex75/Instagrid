//
//  instaView.swift
//  Instagrid
//
//  Created by Alex on 12/12/2018.
//  Copyright © 2018 Alexandre Holet. All rights reserved.
//

import UIKit

class InstaView: UIView {

    @IBOutlet private var leftTopCornerImage : UIImageView!
    @IBOutlet private var rightTopCornerImage : UIImageView!
    @IBOutlet private var leftBottomCornerImage : UIImageView!
    @IBOutlet private var rightBottomCornerImage : UIImageView!
    
    enum Style{
        case numberOne, numberTwo, numberThree
    }
    
    var style : Style = .numberOne {
        didSet{
            setStyle(style)
        }
    }
    
    private func setStyle(_ style : Style){
        switch style {
        case .numberOne:
            rightTopCornerImage.isHidden = true
            rightBottomCornerImage.isHidden = false
        case .numberTwo:
            rightBottomCornerImage.isHidden = false
            rightTopCornerImage.isHidden = false
        case .numberThree:
            rightBottomCornerImage.isHidden = true
            rightTopCornerImage.isHidden = false
        
        }
    }

}
