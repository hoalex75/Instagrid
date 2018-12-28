//
//  Model.swift
//  Instagrid
//
//  Created by Alex on 22/12/2018.
//  Copyright © 2018 Alexandre Holet. All rights reserved.
//

import Foundation
import UIKit

public struct Model{
    var lastImagePicked : UIImage?
    var imageViewSelected : UIImageView?
    let textSwipePortrait = "Swipe top to share"
    let textSwipeLandscape = "Swipe left to share"
    let colorCollection = ["Dark Blue" : UIColor(red: 16.0, green: 102.0, blue: 152.0, alpha: 1.0), "Light Blue" : UIColor(red: 183.0, green: 215.0, blue: 229.0, alpha: 1.0), "Dark Green" : UIColor(red: 95.0, green: 186.0, blue: 96.0, alpha: 1.0), "Light Green" : UIColor(red: 160, green: 234, blue: 152, alpha: 1.0), "Dark Red" : UIColor(red: 191, green: 21, blue: 19, alpha: 1.0), "Light Red" : UIColor(red: 239, green: 110, blue: 110, alpha: 126)]
    var color = 0
    
    init(){
        lastImagePicked = nil
        imageViewSelected = nil
    }
    
    func share(image : UIImage) -> UIActivityViewController {
        let activityViewController : UIActivityViewController = UIActivityViewController(
            activityItems: [image], applicationActivities: nil)
        activityViewController.excludedActivityTypes = [
            UIActivity.ActivityType.postToWeibo,
            UIActivity.ActivityType.print,
            UIActivity.ActivityType.assignToContact,
            UIActivity.ActivityType.saveToCameraRoll,
            UIActivity.ActivityType.addToReadingList,
            UIActivity.ActivityType.postToFlickr,
            UIActivity.ActivityType.postToVimeo,
            UIActivity.ActivityType.postToTencentWeibo
        ]
        
        return activityViewController
    }
    
    mutating func whichColor() -> [UIColor] {
        var tab = [UIColor]()
        color += 1
        switch color%3 {
        case 0 :
            if let colorDark = colorCollection["Dark Blue"], let colorLight = colorCollection["Light Blue"] {
                tab.append(colorDark)
                tab.append(colorLight)
            } else {
                print("error 0")
            }
        case 1 :
            if let colorDark = colorCollection["Dark Green"], let colorLight = colorCollection["Light Green"] {
                tab.append(colorDark)
                tab.append(colorLight)
            } else {
                print("error 1")
            }
        case 2 :
            if let colorDark = colorCollection["Dark Red"], let colorLight = colorCollection["Light Red"] {
                tab.append(colorDark)
                tab.append(colorLight)
            } else {
                print("error 2")
            }
        default :
            break
        }
        
        return tab
    }
    
}
