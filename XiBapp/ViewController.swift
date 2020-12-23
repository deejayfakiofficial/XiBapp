//
//  ViewController.swift
//  XiBapp
//
//  Created by Admin on 23.12.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customView: CustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customView.configureView(titleLB: "Left", titleRB: "Right", backgroundColor: .darkGray, cornerRadius: 20, tintColor: .white)
    }


}

