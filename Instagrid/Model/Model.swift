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
    private let colorCollection = ["Dark Blue" : UIColor(red: 16/255, green: 102/255, blue: 152/255, alpha: 1.0), "Light Blue" : UIColor(red: 183/255, green: 215/255, blue: 229/255, alpha: 1.0), "Dark Green" : UIColor(red: 95/255, green: 186/255, blue: 96/255, alpha: 1.0), "Light Green" : UIColor(red: 160/255, green: 234/255, blue: 152/255, alpha: 1.0), "Dark Red" : UIColor(red: 191/255, green: 21/255, blue: 19/255, alpha: 1.0), "Light Red" : UIColor(red: 239/255, green: 110/255, blue: 110/255, alpha: 1.0)]
    private var color = 0
    
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
