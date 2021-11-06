//
//  ViewController.swift
//  lesson9
//
//  Created by Андрей Антонен on 01.11.2021.
//

import UIKit

class ViewController: UIViewController, InfoButtonDelegate {
    @IBOutlet weak var infoButton: InfoButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoButton.delegate = self
    }
    func onButtonPress() {
        print("click")
    }

}

