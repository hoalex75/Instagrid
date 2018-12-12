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
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func didTapOne() {
        instaView.style = .numberOne
    }
    
    @IBAction func didTapTwo() {
        instaView.style = .numberTwo
    }
    
    @IBAction func didTapThree() {
        instaView.style = .numberThree
    }
    
}

