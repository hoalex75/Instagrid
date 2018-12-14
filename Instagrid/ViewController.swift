//
//  ViewController.swift
//  Instagrid
//
//  Created by Alex on 12/12/2018.
//  Copyright © 2018 Alexandre Holet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var instaView: InstaView!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
}

