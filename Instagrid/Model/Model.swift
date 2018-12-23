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
}
