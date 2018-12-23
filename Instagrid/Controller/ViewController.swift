//
//  ViewController.swift
//  Instagrid
//
//  Created by Alex on 12/12/2018.
//  Copyright © 2018 Alexandre Holet. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var instaView: InstaView!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    let imagePicker = UIImagePickerController()
    var model = Model(lastImagePicked : nil, imageViewSelected : nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
        
        imagePicker.delegate = self
        addGesturesToImageViews()
        let swipeTop = UISwipeGestureRecognizer(target: self, action: #selector(swipe(_:)))
        swipeTop.direction = .up
        self.view.addGestureRecognizer(swipeTop)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func rotated() {
        let style = instaView.style
        instaView.style = style
    }
    
    @IBAction func didTapOne() {
        instaView.style = .numberOne
        selectButtonImage(buttonOne)
        
    }
    
    @IBAction func didTapTwo() {
        instaView.style = .numberTwo
        selectButtonImage(buttonTwo)
    }
    
    @IBAction func didTapThree() {
        instaView.style = .numberThree
        selectButtonImage(buttonThree)
    }
    
    private func selectButtonImage(_ buttonSelected : UIButton){
        let buttons : [UIButton] = [buttonOne,buttonTwo,buttonThree]
        for button in buttons {
            button == buttonSelected ? button.setImage(UIImage(named: "Selected"), for: .normal) : button.setImage(nil, for: .normal)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }
        model.imageViewSelected!.clipsToBounds = true
        model.imageViewSelected!.contentMode = .scaleAspectFill
        model.imageViewSelected!.image = image
        picker.dismiss(animated: true,completion: nil)
    }
    
    @objc func tapSomeView(_ sender: UITapGestureRecognizer) {
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker,animated: true, completion : nil)
        guard let viewTapped = sender.view as? UIImageView else {
            return
        }
        model.imageViewSelected = viewTapped
    }
    
    @objc func swipe( _ sender: UISwipeGestureRecognizer){
        switch sender.direction {
        case .up:
            self.present(model.share(image: instaView.asImage()), animated: true, completion: nil)
        default:
            break
        }
    }
    
    private func addGesturesToImageViews(){
        let tapLeftTop = UITapGestureRecognizer(target: self, action: #selector(tapSomeView(_:)))
        let tapLeftBottom = UITapGestureRecognizer(target: self, action: #selector(tapSomeView(_:)))
        let tapRightTop = UITapGestureRecognizer(target: self, action: #selector(tapSomeView(_:)))
        let tapRightBottom = UITapGestureRecognizer(target: self, action: #selector(tapSomeView(_:)))
        
        for imageViews in instaView.subviews {
            imageViews.isUserInteractionEnabled = true
        }
        
        instaView.leftTopCornerImage.addGestureRecognizer(tapLeftTop)
        instaView.leftBottomCornerImage.addGestureRecognizer(tapLeftBottom)
        instaView.rightTopCornerImage.addGestureRecognizer(tapRightTop)
        instaView.rightBottomCornerImage.addGestureRecognizer(tapRightBottom)
    }
    
    
    
}

